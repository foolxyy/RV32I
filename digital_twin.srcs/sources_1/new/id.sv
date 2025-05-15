// id.sv
// Instruction Decode (ID) stage

module id (
    input  logic        rst,
    input  logic [31:0] inst_i,
    input  logic [31:0] inst_addr_i,
    input  logic [31:0] rdata1_i,
    input  logic [31:0] rdata2_i,
    input  logic [4:0]  ex_rd_i,
    input  logic        ex_reg_we_i,
    input  logic [4:0]  mem_rd_i,
    input  logic        mem_reg_we_i,
    output logic [4:0]  rs1_o,
    output logic [4:0]  rs2_o,
    output logic [4:0]  rd_o,
    output logic        reg_we_o,
    output logic [31:0] imm_o,
    output logic [31:0] reg1_o,
    output logic [31:0] reg2_o,
    output logic [31:0] inst_o,
    output logic [31:0] inst_addr_o,
    output logic        stall_req_o
);

    logic [6:0] opcode   = inst_i[6:0];
    logic [2:0] funct3   = inst_i[14:12];
    logic [6:0] funct7   = inst_i[31:25];
    logic [4:0] rs1_idx  = inst_i[19:15];
    logic [4:0] rs2_idx  = inst_i[24:20];
    logic [4:0] rd_idx   = inst_i[11:7];

    logic        reg_we;
    logic [31:0] imm;

    always_comb begin
        reg_we   = 1'b0;
        imm      = 32'b0;
        rs1_o    = rs1_idx;
        rs2_o    = rs2_idx;
        rd_o     = rd_idx;
        reg_we_o = 1'b0;

        unique case (opcode)
            7'b0110111: begin // LUI
                imm = {inst_i[31:12], 12'b0};
                reg_we = (rd_idx != 5'd0);
                rs1_o = 5'd0;
                rs2_o = 5'd0;
            end
            7'b0010111: begin // AUIPC
                imm = {inst_i[31:12], 12'b0};
                reg_we = (rd_idx != 5'd0);
                rs1_o = 5'd0;
                rs2_o = 5'd0;
            end
            7'b1101111: begin // JAL
                imm = {{11{inst_i[31]}}, inst_i[31], inst_i[19:12], inst_i[20], inst_i[30:21], 1'b0};
                reg_we = (rd_idx != 5'd0);
                rs1_o = 5'd0;
                rs2_o = 5'd0;
            end
            7'b1100111: begin // JALR
                imm = {{20{inst_i[31]}}, inst_i[31:20]};
                reg_we = (rd_idx != 5'd0);
                rs1_o = rs1_idx;
                rs2_o = 5'd0;
            end
            7'b1100011: begin // Branch
                imm = {{19{inst_i[31]}}, inst_i[31], inst_i[7], inst_i[30:25], inst_i[11:8], 1'b0};
                reg_we = 1'b0;
            end
            7'b0000011: begin // Load
                imm = {{20{inst_i[31]}}, inst_i[31:20]};
                reg_we = (rd_idx != 5'd0);
                rs1_o = rs1_idx;
                rs2_o = 5'd0;
            end
            7'b0100011: begin // Store
                imm = {{20{inst_i[31]}}, inst_i[31:25], inst_i[11:7]};
                reg_we = 1'b0;
            end
            7'b0010011: begin // I-type ALU
                imm = {{20{inst_i[31]}}, inst_i[31:20]};
                reg_we = (rd_idx != 5'd0);
            end
            7'b0110011: begin // R-type ALU
                imm = 32'b0;
                reg_we = (rd_idx != 5'd0);
            end
            default: begin
                imm = 32'b0;
                reg_we = 1'b0;
            end
        endcase
    end

    assign reg1_o       = rdata1_i;
    assign reg2_o       = rdata2_i;
    assign reg_we_o     = reg_we;
    assign imm_o        = imm;
    assign inst_o       = inst_i;
    assign inst_addr_o  = inst_addr_i;


    logic hazard_ex  = ex_reg_we_i  && (ex_rd_i  != 5'd0) && ((ex_rd_i  == rs1_o) || (ex_rd_i  == rs2_o));
    logic hazard_mem = mem_reg_we_i && (mem_rd_i != 5'd0) && ((mem_rd_i == rs1_o) || (mem_rd_i == rs2_o));
    assign stall_req_o = (hazard_ex || hazard_mem);

endmodule
