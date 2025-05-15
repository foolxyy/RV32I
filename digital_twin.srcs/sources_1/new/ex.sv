module ex (
    input  logic        clk,
    input  logic        rst,
    // 来自ID/EX的输入信号
    input  logic [31:0] inst_i,
    input  logic [31:0] inst_addr_i,
    input  logic [31:0] reg1_i,
    input  logic [31:0] reg2_i,
    input  logic [31:0] imm_i,
    input  logic [4:0]  rd_i,
    input  logic        reg_we_i,
    // 输出信号
    output logic        jump_flag_o,   // 跳转（分支）标志
    output logic [31:0] jump_addr_o,   // 跳转目标地址
    output logic [31:0] ex_result_o,   // 算术/逻辑计算结果（或用于写回的值）
    output logic [4:0]  rd_o,          // 传递的目标寄存器号
    output logic        reg_we_o,      // 传递的寄存器写使能
    // 访存接口信号（送入MEM阶段）
    output logic [31:0] mem_addr_o,    // 计算出的访存地址
    output logic        mem_wen_o,     // 存储写使能，高电平表示写操作
    output logic [3:0]  mem_mask_o,    // 存储写掩码
    output logic [31:0] mem_wdata_o,   // 存储写数据
    output logic [31:0] inst_o         // 将指令传递给MEM阶段（用于决定load扩展）
);
    // 提取指令字段
    logic [6:0] opcode = inst_i[6:0];
    logic [2:0] funct3 = inst_i[14:12];
    logic [6:0] funct7 = inst_i[31:25];

    // 默认赋值（空操作默认无跳转、无存储、结果为0）
    jump_flag_o  = 1'b0;
    jump_addr_o  = 32'b0;
    mem_wen_o    = 1'b0;
    mem_addr_o   = 32'b0;
    mem_mask_o   = 4'b0000;
    mem_wdata_o  = 32'b0;
    ex_result_o  = 32'b0;
    rd_o         = rd_i;
    reg_we_o     = reg_we_i;
    inst_o       = inst_i;  // 将指令向后传递

    // 根据opcode执行不同操作
    if (opcode == 7'b1100011) begin  
        // **分支指令** (BEQ, BNE, BLT, BGE, BLTU, BGEU)
        logic take_branch;
        case (funct3)
            3'b000: take_branch = (reg1_i == reg2_i);               // BEQ
            3'b001: take_branch = (reg1_i != reg2_i);               // BNE
            3'b100: take_branch = ($signed(reg1_i) < $signed(reg2_i));   // BLT
            3'b101: take_branch = ($signed(reg1_i) >= $signed(reg2_i));  // BGE
            3'b110: take_branch = ($unsigned(reg1_i) < $unsigned(reg2_i)); // BLTU
            3'b111: take_branch = ($unsigned(reg1_i) >= $unsigned(reg2_i)); // BGEU
            default: take_branch = 1'b0;
        endcase
        if (take_branch) begin
            jump_flag_o = 1'b1;
            jump_addr_o = inst_addr_i + imm_i;  // 目标地址 = 当前PC + 分支偏移
        end
        // 分支指令不写通用寄存器，reg_we_i已经为0
        ex_result_o = 32'b0;
    end else if (opcode == 7'b1101111) begin  
        // **JAL**（无条件跳转并链接）
        jump_flag_o = 1'b1;
        jump_addr_o = inst_addr_i + imm_i;      // 目标地址 = 当前PC + 偏移
        ex_result_o = inst_addr_i + 32'd4;      // 将下一条指令地址（PC+4）作为返回地址保存
        // reg_we_i应为1，rd_i为链接寄存器
    end else if (opcode == 7'b1100111) begin  
        // **JALR**（寄存器间接跳转并链接）
        jump_flag_o = 1'b1;
        // 目标地址 = (rs1 + imm) 且最低位清0（对齐）
        jump_addr_o = (reg1_i + imm_i) & ~32'b1;
        ex_result_o = inst_addr_i + 32'd4;      // 保存返回地址（PC+4）
        // reg_we_i应为1，rd_i为链接寄存器
    end else if (opcode == 7'b0110111) begin  
        // **LUI**（高位立即数加载）
        ex_result_o = imm_i;    // 立即数已经移位到位
        // reg_we_i=1, rd_i为目标寄存器
    end else if (opcode == 7'b0010111) begin  
        // **AUIPC**（将高位立即数加到PC）
        ex_result_o = inst_addr_i + imm_i;  // 计算结果=当前PC + 偏移
        // reg_we_i=1
    end else if (opcode == 7'b0000011) begin  
        // **Load 加载指令** (LB/LH/LW/LBU/LHU)
        mem_wen_o = 1'b0;                   // 读操作
        mem_addr_o = reg1_i + imm_i;        // 计算数据地址
        mem_mask_o = 4'b1111;              // 读操作可将掩码全使能（或忽略）
        mem_wdata_o = 32'b0;
        // 等待MEM阶段取回数据后再写寄存器，ex_result_o暂不使用
        ex_result_o = 32'b0;
        // reg_we_i=1（目标寄存器在MEM阶段写入）
    end else if (opcode == 7'b0100011) begin  
        // **Store 存储指令** (SB/SH/SW)
        mem_wen_o = 1'b1;                   // 写操作使能
        mem_addr_o = reg1_i + imm_i;        // 计算存储地址
        // 根据funct3和地址低两位决定写掩码和写数据的排列
        case (funct3)
            3'b000: begin // SB，写一个字节
                case (mem_addr_o[1:0])
                    2'b00: begin 
                        mem_mask_o = 4'b0001; 
                        mem_wdata_o = {24'b0, reg2_i[7:0]}; 
                    end
                    2'b01: begin 
                        mem_mask_o = 4'b0010; 
                        mem_wdata_o = {16'b0, reg2_i[7:0], 8'b0};
                    end
                    2'b10: begin 
                        mem_mask_o = 4'b0100; 
                        mem_wdata_o = {8'b0, reg2_i[7:0], 16'b0};
                    end
                    2'b11: begin 
                        mem_mask_o = 4'b1000; 
                        mem_wdata_o = {reg2_i[7:0], 24'b0};
                    end
                endcase
            end
            3'b001: begin // SH，写两个字节
                case (mem_addr_o[1:0])
                    2'b00: begin 
                        mem_mask_o = 4'b0011; 
                        mem_wdata_o = {16'b0, reg2_i[15:0]}; 
                    end
                    2'b10: begin 
                        mem_mask_o = 4'b1100; 
                        mem_wdata_o = {reg2_i[15:0], 16'b0}; 
                    end
                    default: begin 
                        mem_mask_o = 4'b0000; 
                        mem_wdata_o = 32'b0;
                    end
                endcase
            end
            3'b010: begin // SW，写四个字节
                mem_mask_o = 4'b1111;
                mem_wdata_o = reg2_i;
            end
            default: begin 
                mem_mask_o = 4'b0000;
                mem_wdata_o = 32'b0;
            end
        endcase
        // 存储指令不写通用寄存器
        ex_result_o = 32'b0;
        // reg_we_i应为0
    end else if (opcode == 7'b0110011) begin  
        // **R-Type 算术/逻辑运算** (ADD/SUB/SLL/SLT/SLTU/XOR/SRL/SRA/OR/AND)
        case (funct3)
            3'b000: begin  // ADD/SUB
                if (funct7 == 7'b0100000) 
                    ex_result_o = reg1_i - reg2_i;   // SUB
                else 
                    ex_result_o = reg1_i + reg2_i;   // ADD
            end
            3'b001: ex_result_o = reg1_i << (reg2_i[4:0]);            // SLL
            3'b010: ex_result_o = ($signed(reg1_i) < $signed(reg2_i)) ? 32'd1 : 32'd0;   // SLT
            3'b011: ex_result_o = ($unsigned(reg1_i) < $unsigned(reg2_i)) ? 32'd1 : 32'd0; // SLTU
            3'b100: ex_result_o = reg1_i ^ reg2_i;                    // XOR
            3'b101: begin  // SRL/SRA
                if (funct7 == 7'b0100000) 
                    ex_result_o = $signed(reg1_i) >>> (reg2_i[4:0]);  // SRA (算术右移)
                else 
                    ex_result_o = reg1_i >> (reg2_i[4:0]);            // SRL (逻辑右移)
            end
            3'b110: ex_result_o = reg1_i | reg2_i;                    // OR
            3'b111: ex_result_o = reg1_i & reg2_i;                    // AND
            default: ex_result_o = 32'b0;
        endcase
        // reg_we_i通常为1，rd_i指定写回目标寄存器
    end else if (opcode == 7'b0010011) begin  
        // **I-Type 算术/逻辑运算** (ADDI/SLTI/SLTIU/XORI/ORI/ANDI/SLLI/SRLI/SRAI)
        case (funct3)
            3'b000: ex_result_o = reg1_i + imm_i;   // ADDI
            3'b010: ex_result_o = ($signed(reg1_i) < $signed(imm_i)) ? 32'd1 : 32'd0;   // SLTI
            3'b011: ex_result_o = ($unsigned(reg1_i) < $unsigned(imm_i)) ? 32'd1 : 32'd0; // SLTIU
            3'b100: ex_result_o = reg1_i ^ imm_i;   // XORI
            3'b110: ex_result_o = reg1_i | imm_i;   // ORI
            3'b111: ex_result_o = reg1_i & imm_i;   // ANDI
            3'b001: ex_result_o = reg1_i << (imm_i[4:0]);  // SLLI
            3'b101: begin  // SRLI/SRAI
                if (inst_i[30] == 1'b1) 
                    ex_result_o = $signed(reg1_i) >>> (imm_i[4:0]);   // SRAI
                else 
                    ex_result_o = reg1_i >> (imm_i[4:0]);             // SRLI
            end
            default: ex_result_o = 32'b0;
        endcase
        // reg_we_i=1
    end else begin
        // **缺省情况**：无需执行任何操作
        ex_result_o = 32'b0;
        reg_we_o   = 1'b0;
    end
endmodule
