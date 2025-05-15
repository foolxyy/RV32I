module pc_reg (
    input  logic        clk,
    input  logic        rst,
    input  logic        jump_flag_i,   // 跳转标志，高电平表示进行跳转
    input  logic [31:0] jump_addr_i,   // 跳转目标地址
    input  logic        stall_i,       // 暂停标志，高电平表示流水线暂停（PC保持）
    output logic [31:0] pc_o           // 当前PC值（指令地址）
);
    // PC复位初值，竞赛要求复位到0x8000_0000
    localparam [31:0] RESET_ADDR = 32'h8000_0000;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            pc_o <= RESET_ADDR;
        end else if (jump_flag_i) begin  
            // 发出跳转信号时，PC直接更新为跳转目标地址
            pc_o <= jump_addr_i;
        end else if (stall_i) begin      
            // 暂停标志有效时，保持PC不变（流水线暂停）
            pc_o <= pc_o;
        end else begin                   
            // 正常顺序执行，PC按字节递增4（32位对齐）
            pc_o <= pc_o + 32'd4;
        end
    end
endmodule
