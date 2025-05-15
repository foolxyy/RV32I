// regs.sv
// General-purpose register file (32 x 32-bit)

module regs (
    input  logic        clk,
    input  logic        rst,
    input  logic        we_i,
    input  logic [4:0]  waddr_i,
    input  logic [31:0] wdata_i,
    input  logic [4:0]  raddr1_i,
    input  logic [4:0]  raddr2_i,
    output logic [31:0] rdata1_o,
    output logic [31:0] rdata2_o
);

    logic [31:0] regfile [31:0];

    // Write logic
    always_ff @(posedge clk) begin
        if (we_i && (waddr_i != 5'd0)) begin
            regfile[waddr_i] <= wdata_i;
        end
    end

    // Read logic
    always_comb begin
        rdata1_o = (raddr1_i == 5'd0) ? 32'b0 : regfile[raddr1_i];
        rdata2_o = (raddr2_i == 5'd0) ? 32'b0 : regfile[raddr2_i];
    end

endmodule
