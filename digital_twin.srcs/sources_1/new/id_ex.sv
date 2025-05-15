module id_ex (
    input  logic        clk,
    input  logic        rst,
    input  logic        flush_i,        // 刷新控制（插入空操作）
    // 来自ID阶段的输入信号
    input  logic [31:0] inst_i,
    input  logic [31:0] inst_addr_i,
    input  logic [31:0] reg1_i,
    input  logic [31:0] reg2_i,
    input  logic [31:0] imm_i,
    input  logic [4:0]  rd_i,
    input  logic        reg_we_i,
    // 传递给EX阶段的输出信号
    output logic [31:0] inst_o,
    output logic [31:0] inst_addr_o,
    output logic [31:0] reg1_o,
    output logic [31:0] reg2_o,
    output logic [31:0] imm_o,
    output logic [4:0]  rd_o,
    output logic        reg_we_o
);
    localparam [31:0] NOP_INST = 32'h0000_0013;  // NOP指令
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            // 复位时插入NOP到EX阶段，清除控制信号
            inst_o      <= NOP_INST;
            inst_addr_o <= 32'b0;
            reg1_o      <= 32'b0;
            reg2_o      <= 32'b0;
            imm_o       <= 32'b0;
            rd_o        <= 5'd0;
            reg_we_o    <= 1'b0;
        end else if (flush_i) begin
            // 刷新（例如数据冒险时）插入空操作进入EX阶段
            inst_o      <= NOP_INST;
            inst_addr_o <= 32'b0;
            reg1_o      <= 32'b0;
            reg2_o      <= 32'b0;
            imm_o       <= 32'b0;
            rd_o        <= 5'd0;
            reg_we_o    <= 1'b0;
        end else begin
            // 正常传递ID阶段输出信号到EX阶段
            inst_o      <= inst_i;
            inst_addr_o <= inst_addr_i;
            reg1_o      <= reg1_i;
            reg2_o      <= reg2_i;
            imm_o       <= imm_i;
            rd_o        <= rd_i;
            reg_we_o    <= reg_we_i;
        end
    end
endmodule
