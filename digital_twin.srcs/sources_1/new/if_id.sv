module if_id (
    input  logic        clk,
    input  logic        rst,
    input  logic        flush_i,        // 刷新控制（插入NOP）
    input  logic        stall_i,        // 暂停控制（保持上周期值）
    input  logic [31:0] inst_i,         // 取指阶段取得的指令
    input  logic [31:0] inst_addr_i,    // 取指阶段的指令地址
    output logic [31:0] inst_o,         // 传递给ID阶段的指令
    output logic [31:0] inst_addr_o     // 传递给ID阶段的指令地址
);
    // 定义空操作NOP指令的机器码：ADDI x0,x0,0 对应32'h0000_0013
    localparam [31:0] NOP_INST = 32'h0000_0013;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            inst_o      <= NOP_INST;
            inst_addr_o <= 32'b0;
        end else if (flush_i) begin  
            // 刷新时，将进入ID的指令置为NOP，地址可以置0（或无效值）
            inst_o      <= NOP_INST;
            inst_addr_o <= 32'b0;
        end else if (stall_i) begin  
            // 暂停时，保持上一次的值不变（不加载新指令）
            inst_o      <= inst_o;
            inst_addr_o <= inst_addr_o;
        end else begin               
            // 正常情况下，将IF阶段取到的指令传递给ID阶段
            inst_o      <= inst_i;
            inst_addr_o <= inst_addr_i;
        end
    end
endmodule
