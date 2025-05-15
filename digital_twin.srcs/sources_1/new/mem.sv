// mem.sv
// Memory access stage (MEM)

module mem (
    input  logic        clk,
    input  logic        rst,

    input  logic [31:0] inst_i,
    input  logic [4:0]  rd_i,
    input  logic        reg_we_i,
    input  logic [31:0] ex_result_i,

    input  logic [31:0] mem_addr_i,
    input  logic        mem_wen_i,
    input  logic [3:0]  mem_mask_i,
    input  logic [31:0] mem_wdata_i,

    input  logic [31:0] perip_rdata,

    // Placeholder outputs for contest top-level
    output logic [31:0] perip_addr,
    output logic        perip_wen,
    output logic [3:0]  perip_mask,
    output logic [31:0] perip_wdata,

    output logic        reg_we_o,
    output logic [4:0]  reg_waddr_o,
    output logic [31:0] reg_wdata_o
);

    logic [6:0] opcode;
    logic [2:0] funct3;
    assign opcode = inst_i[6:0];
    assign funct3 = inst_i[14:12];

    assign perip_addr  = mem_addr_i;
    assign perip_wen   = mem_wen_i;
    assign perip_mask  = mem_mask_i;
    assign perip_wdata = mem_wdata_i;

    always_comb begin
        reg_we_o     = reg_we_i;
        reg_waddr_o  = rd_i;
        reg_wdata_o  = ex_result_i;

        if (opcode == 7'b0000011) begin // Load
            unique case (funct3)
                3'b000: reg_wdata_o = {{24{perip_rdata[7]}},  perip_rdata[7:0]};   // LB
                3'b001: reg_wdata_o = {{16{perip_rdata[15]}}, perip_rdata[15:0]}; // LH
                3'b010: reg_wdata_o = perip_rdata;                                // LW
                3'b100: reg_wdata_o = {24'b0, perip_rdata[7:0]};                  // LBU
                3'b101: reg_wdata_o = {16'b0, perip_rdata[15:0]};                 // LHU
                default: reg_wdata_o = 32'b0;
            endcase
        end else if (opcode == 7'b0100011) begin // Store
            reg_we_o    = 1'b0;
            reg_waddr_o = 5'd0;
            reg_wdata_o = 32'b0;
        end
    end

endmodule
