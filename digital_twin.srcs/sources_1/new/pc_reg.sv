module pc_reg (
    input  logic        clk,
    input  logic        rst,
    input  logic        jump_flag_i,    // 跳转请求
    input  logic [31:0] jump_addr_i,    // 跳转目标地址
    input  logic        hold_flag_i,    // 暂停控制（数据冒险/存储等待）
    output logic [31:0] pc_o            // 输出的PC值（指令地址）
);

    localparam RESET_ADDR = 32'h8000_0000;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            pc_o <= RESET_ADDR;
        end else if (jump_flag_i) begin
            pc_o <= jump_addr_i;
        end else if (hold_flag_i) begin
            pc_o <= pc_o; // 保持当前值（暂停）
        end else begin
            pc_o <= pc_o + 32'd4; // 正常流水，每次+4字节
        end
    end

endmodule
