module mem (
    input  logic        clk,
    input  logic        rst,
    // 来自EX阶段的输入信号
    input  logic [31:0] inst_i,
    input  logic [4:0]  rd_i,
    input  logic        reg_we_i,
    input  logic [31:0] ex_result_i,
    input  logic [31:0] mem_addr_i,
    input  logic        mem_wen_i,
    input  logic [3:0]  mem_mask_i,
    input  logic [31:0] mem_wdata_i,
    // 从数据存储器/外设读取的数据
    input  logic [31:0] perip_rdata,
    // 输出至数据存储器/外设的信号
    output logic [31:0] perip_addr,
    output logic        perip_wen,
    output logic [3:0]  perip_mask,
    output logic [31:0] perip_wdata,
    // 通用寄存器写回信号
    output logic        reg_we_o,
    output logic [4:0]  reg_waddr_o,
    output logic [31:0] reg_wdata_o
);
    // 寄存输入信号，形成EX/MEM流水寄存器
    logic [31:0] inst_r;
    logic [4:0]  rd_r;
    logic        reg_we_r;
    logic [31:0] ex_result_r;
    logic [31:0] mem_addr_r;
    logic        mem_wen_r;
    logic [3:0]  mem_mask_r;
    logic [31:0] mem_wdata_r;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            inst_r       <= 32'b0;
            rd_r         <= 5'd0;
            reg_we_r     <= 1'b0;
            ex_result_r  <= 32'b0;
            mem_addr_r   <= 32'b0;
            mem_wen_r    <= 1'b0;
            mem_mask_r   <= 4'b0;
            mem_wdata_r  <= 32'b0;
        end else begin
            inst_r       <= inst_i;
            rd_r         <= rd_i;
            reg_we_r     <= reg_we_i;
            ex_result_r  <= ex_result_i;
            mem_addr_r   <= mem_addr_i;
            mem_wen_r    <= mem_wen_i;
            mem_mask_r   <= mem_mask_i;
            mem_wdata_r  <= mem_wdata_i;
        end
    end

    // 将地址和写信号直接输出到总线（与外设/存储器接口连接）
    assign perip_addr  = mem_addr_r;
    assign perip_wen   = mem_wen_r;
    assign perip_mask  = mem_mask_r;
    assign perip_wdata = mem_wdata_r;

    // 根据指令类型决定写回数据：
    always_comb begin
        reg_waddr_o = rd_r;
        reg_we_o    = reg_we_r;
        if (reg_we_r) begin
            if (inst_r[6:0] == 7'b0000011) begin 
                // Load指令，根据funct3进行符号扩展/零扩展
                case (inst_r[14:12])
                    3'b000: reg_wdata_o = {{24{perip_rdata[7]}},  perip_rdata[7:0]};    // LB
                    3'b001: reg_wdata_o = {{16{perip_rdata[15]}}, perip_rdata[15:0]};   // LH
                    3'b010: reg_wdata_o = perip_rdata;                                 // LW
                    3'b100: reg_wdata_o = {24'b0, perip_rdata[7:0]};                   // LBU
                    3'b101: reg_wdata_o = {16'b0, perip_rdata[15:0]};                  // LHU
                    default: reg_wdata_o = perip_rdata;
                endcase
            } else begin
                // 非load指令，直接使用EX阶段结果
                reg_wdata_o = ex_result_r;
            end
        end else begin
            // 不需要写回寄存器
            reg_wdata_o = 32'b0;
        end
    end
endmodule
