module regs (
    input  logic        clk,
    input  logic        rst,
    input  logic        we_i,        // 写使能信号，高电平表示进行写入
    input  logic [4:0]  waddr_i,     // 写地址（目标寄存器号）
    input  logic [31:0] wdata_i,     // 写数据
    input  logic [4:0]  raddr1_i,    // 读地址1（源寄存器rs1）
    input  logic [4:0]  raddr2_i,    // 读地址2（源寄存器rs2）
    output logic [31:0] rdata1_o,    // 读数据1
    output logic [31:0] rdata2_o     // 读数据2
);
    // 32个32位寄存器数组
    logic [31:0] regfile [31:0];
    integer i;
    // 异步读，时序写：x0始终为0
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            // 复位时将所有寄存器清零（x0保持0）
            for (i = 0; i < 32; i++) begin
                regfile[i] <= 32'b0;
            end
        end else if (we_i && (waddr_i != 5'd0)) begin
            // 时钟上升沿写入（x0寄存器的写入请求被忽略）
            regfile[waddr_i] <= wdata_i;
        end
    end

    always_comb begin
        // 异步读取端口1
        if (raddr1_i == 5'd0) 
            rdata1_o = 32'b0;
        else 
            rdata1_o = regfile[raddr1_i];
        // 异步读取端口2
        if (raddr2_i == 5'd0) 
            rdata2_o = 32'b0;
        else 
            rdata2_o = regfile[raddr2_i];
    end
endmodule
