module id (
    input  logic        rst,
    input  logic [31:0] inst_i,       // 来自IF/ID的指令内容
    input  logic [31:0] inst_addr_i,  // 来自IF/ID的指令地址
    // 寄存器堆读口
    input  logic [31:0] rdata1_i,     // 通用寄存器1读数据（rs1值）
    input  logic [31:0] rdata2_i,     // 通用寄存器2读数据（rs2值）
    // 来自执行阶段的信息（用于数据相关检测）
    input  logic [4:0]  ex_rd_i,      // EX阶段正在写回的目标寄存器号
    input  logic        ex_reg_we_i,  // EX阶段目标寄存器写使能
    input  logic [4:0]  mem_rd_i,     // MEM阶段正在写回的目标寄存器号
    input  logic        mem_reg_we_i, // MEM阶段目标寄存器写使能
    // 输出到寄存器堆的读地址
    output logic [4:0]  rs1_o,        // 通用寄存器1读地址（根据指令rs1字段）
    output logic [4:0]  rs2_o,        // 通用寄存器2读地址（根据指令rs2字段）
    // 输出给执行阶段的译码结果
    output logic [4:0]  rd_o,         // 目标寄存器地址（rd）
    output logic        reg_we_o,     // 通用寄存器写使能
    output logic [31:0] imm_o,        // 立即数扩展值
    output logic [31:0] reg1_o,       // 源操作数1值（rs1读出）
    output logic [31:0] reg2_o,       // 源操作数2值（rs2读出）
    output logic [31:0] inst_o,       // 传递给ID/EX的指令内容
    output logic [31:0] inst_addr_o,  // 传递给ID/EX的指令地址
    output logic        stall_req_o   // 流水线暂停请求（数据相关 hazard 检测）
);
    // 提取指令各字段
    logic [6:0] opcode   = inst_i[6:0];
    logic [2:0] funct3   = inst_i[14:12];
    logic [6:0] funct7   = inst_i[31:25];
    logic [4:0] rs1_idx  = inst_i[19:15];
    logic [4:0] rs2_idx  = inst_i[24:20];
    logic [4:0] rd_idx   = inst_i[11:7];

    // 默认输出信号
    logic        reg_we;   // 内部信号用于组合逻辑赋值后再驱动输出
    logic [31:0] imm;
    reg_we   = 1'b0;
    imm      = 32'b0;
    rs1_o    = rs1_idx;
    rs2_o    = rs2_idx;
    rd_o     = rd_idx;
    reg_we_o = 1'b0;

    // 根据指令类型进行译码
    unique case (opcode)
        7'b0110111: begin  // LUI
            // 取高20位立即数，低12位补零
            imm = {inst_i[31:12], 12'b0};
            rd_o = rd_idx;
            reg_we = (rd_idx != 5'd0);  // 写入目标寄存器（若目标寄存器非x0）
            // LUI不使用rs1、rs2，将其读地址设为x0以防误读
            rs1_o = 5'd0;
            rs2_o = 5'd0;
        end
        7'b0010111: begin  // AUIPC
            // 取高20位立即数并左移12位
            imm = {inst_i[31:12], 12'b0};
            rd_o = rd_idx;
            reg_we = (rd_idx != 5'd0);
            // AUIPC不使用rs1、rs2
            rs1_o = 5'd0;
            rs2_o = 5'd0;
        end
        7'b1101111: begin  // JAL
            // J型立即数：inst[31]imm[20], inst[19:12]imm[19:12], inst[20]imm[11], inst[30:21]imm[10:1], 最低位0
            imm = {{11{inst_i[31]}}, inst_i[31], inst_i[19:12], inst_i[20], inst_i[30:21], 1'b0};
            rd_o = rd_idx;
            reg_we = (rd_idx != 5'd0);
            // JAL不使用rs1、rs2
            rs1_o = 5'd0;
            rs2_o = 5'd0;
        end
        7'b1100111: begin  // JALR
            // I型立即数，低12位
            imm = {{20{inst_i[31]}}, inst_i[31:20]};
            rd_o = rd_idx;
            reg_we = (rd_idx != 5'd0);
            // 需要读取rs1寄存器，rs2不使用
            rs1_o = rs1_idx;
            rs2_o = 5'd0;
        end
        7'b1100011: begin  // Branch 分支（BEQ/BNE/BLT/BGE/BLTU/BGEU）
            // B型立即数：inst[31]imm[12], inst[7]imm[11], inst[30:25]imm[10:5], inst[11:8]imm[4:1], 最低位0
            imm = {{19{inst_i[31]}}, inst_i[31], inst_i[7], inst_i[30:25], inst_i[11:8], 1'b0};
            // 分支类不写通用寄存器
            rd_o = 5'd0;
            reg_we = 1'b0;
            // 需要读取rs1和rs2用于比较
            rs1_o = rs1_idx;
            rs2_o = rs2_idx;
        end
        7'b0000011: begin  // Load 加载（LB/LH/LW/LBU/LHU）
            // I型立即数（12位偏移）
            imm = {{20{inst_i[31]}}, inst_i[31:20]};
            rd_o = rd_idx;
            reg_we = (rd_idx != 5'd0);
            // 需要rs1作为地址基址，rs2不使用
            rs1_o = rs1_idx;
            rs2_o = 5'd0;
        end
        7'b0100011: begin  // Store 存储（SB/SH/SW）
            // S型立即数：inst[31:25]imm[11:5], inst[11:7]imm[4:0]
            imm = {{20{inst_i[31]}}, inst_i[31:25], inst_i[11:7]};
            // 存储类不写通用寄存器
            rd_o = 5'd0;
            reg_we = 1'b0;
            // 需要rs1作为基址，rs2提供存储数据
            rs1_o = rs1_idx;
            rs2_o = rs2_idx;
        end
        7'b0010011: begin  // I-type ALU 算术/逻辑立即数指令（ADDI等）
            imm = {{20{inst_i[31]}}, inst_i[31:20]};
            rd_o = rd_idx;
            reg_we = (rd_idx != 5'd0);
            // 需要rs1，rs2不适用
            rs1_o = rs1_idx;
            rs2_o = 5'd0;
        end
        7'b0110011: begin  // R-type ALU 算术/逻辑寄存器指令（ADD等）
            // R型指令没有立即数
            imm = 32'b0;
            rd_o = rd_idx;
            reg_we = (rd_idx != 5'd0);
            // 需要rs1和rs2两个源寄存器
            rs1_o = rs1_idx;
            rs2_o = rs2_idx;
        end
        7'b0001111, 7'b1110011: begin  // FENCE (0x0F) 或 SYSTEM (0x73, ecall/ebreak)
            // 这些指令在此简化处理为不产生操作
            imm = 32'b0;
            rd_o = 5'd0;
            reg_we = 1'b0;
            rs1_o = 5'd0;
            rs2_o = 5'd0;
        end
        default: begin
            // 未定义的opcode，默认不执行任何操作（可视为NOP）
            imm = 32'b0;
            rd_o = 5'd0;
            reg_we = 1'b0;
            rs1_o = 5'd0;
            rs2_o = 5'd0;
        end
    endcase

    // 将组合逻辑结果送出  
    reg_we_o   = reg_we;
    imm_o      = imm;
    reg1_o     = rdata1_i;
    reg2_o     = rdata2_i;
    inst_o     = inst_i;
    inst_addr_o= inst_addr_i;

    // 数据相关检测：检查上一个EX阶段或MEM阶段的指令是否写当前指令将用到的寄存器
    logic hazard_ex  = ex_reg_we_i  && (ex_rd_i  != 5'd0)  && ((ex_rd_i  == rs1_o) || (ex_rd_i  == rs2_o));
    logic hazard_mem = mem_reg_we_i && (mem_rd_i != 5'd0)  && ((mem_rd_i == rs1_o) || (mem_rd_i == rs2_o));
    assign stall_req_o = (hazard_ex || hazard_mem);  // 若检测到数据相关，则请求流水线暂停
endmodule
