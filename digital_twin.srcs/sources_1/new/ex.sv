// ex.sv
// Execute (EX) stage

module ex (
    input  logic        clk,
    input  logic        rst,
    input  logic [31:0] inst_i,
    input  logic [31:0] inst_addr_i,
    input  logic [31:0] reg1_i,
    input  logic [31:0] reg2_i,
    input  logic [31:0] imm_i,
    input  logic [4:0]  rd_i,
    input  logic        reg_we_i,

    output logic        jump_flag_o,
    output logic [31:0] jump_addr_o,
    output logic [31:0] ex_result_o,
    output logic [4:0]  rd_o,
    output logic        reg_we_o,

    output logic [31:0] mem_addr_o,
    output logic        mem_wen_o,
    output logic [3:0]  mem_mask_o,
    output logic [31:0] mem_wdata_o,

    output logic [31:0] inst_o
);

    logic [6:0] opcode = inst_i[6:0];
    logic [2:0] funct3 = inst_i[14:12];
    logic [6:0] funct7 = inst_i[31:25];

    always_comb begin
        // Default values
        jump_flag_o  = 1'b0;
        jump_addr_o  = 32'b0;
        ex_result_o  = 32'b0;
        mem_addr_o   = 32'b0;
        mem_wen_o    = 1'b0;
        mem_mask_o   = 4'b0000;
        mem_wdata_o  = 32'b0;
        rd_o         = rd_i;
        reg_we_o     = reg_we_i;
        inst_o       = inst_i;

        unique case (opcode)
            7'b0110011: begin // R-type
                unique case (funct3)
                    3'b000: ex_result_o = (funct7 == 7'b0100000) ? reg1_i - reg2_i : reg1_i + reg2_i;
                    3'b001: ex_result_o = reg1_i << reg2_i[4:0];
                    3'b010: ex_result_o = ($signed(reg1_i) < $signed(reg2_i)) ? 32'b1 : 32'b0;
                    3'b011: ex_result_o = (reg1_i < reg2_i) ? 32'b1 : 32'b0;
                    3'b100: ex_result_o = reg1_i ^ reg2_i;
                    3'b101: ex_result_o = (funct7 == 7'b0100000) ?
                                                $signed(reg1_i) >>> reg2_i[4:0] : reg1_i >> reg2_i[4:0];
                    3'b110: ex_result_o = reg1_i | reg2_i;
                    3'b111: ex_result_o = reg1_i & reg2_i;
                    default: ex_result_o = 32'b0;
                endcase
            end
            7'b0010011: begin // I-type ALU
                unique case (funct3)
                    3'b000: ex_result_o = reg1_i + imm_i;
                    3'b010: ex_result_o = ($signed(reg1_i) < $signed(imm_i)) ? 32'b1 : 32'b0;
                    3'b011: ex_result_o = (reg1_i < imm_i) ? 32'b1 : 32'b0;
                    3'b100: ex_result_o = reg1_i ^ imm_i;
                    3'b110: ex_result_o = reg1_i | imm_i;
                    3'b111: ex_result_o = reg1_i & imm_i;
                    3'b001: ex_result_o = reg1_i << imm_i[4:0];
                    3'b101: ex_result_o = (funct7 == 7'b0100000) ?
                                                $signed(reg1_i) >>> imm_i[4:0] : reg1_i >> imm_i[4:0];
                    default: ex_result_o = 32'b0;
                endcase
            end
            7'b0000011: begin // Load
                mem_addr_o  = reg1_i + imm_i;
                mem_wen_o   = 1'b0;
                mem_mask_o  = 4'b1111;
                mem_wdata_o = 32'b0;
                ex_result_o = 32'b0; // load results handled in MEM
            end
            7'b0100011: begin // Store
                mem_addr_o = reg1_i + imm_i;
                mem_wen_o  = 1'b1;
                reg_we_o   = 1'b0;
                unique case (funct3)
                    3'b000: begin // SB
                        unique case (mem_addr_o[1:0])
                            2'b00: begin mem_mask_o = 4'b0001; mem_wdata_o = {24'b0, reg2_i[7:0]}; end
                            2'b01: begin mem_mask_o = 4'b0010; mem_wdata_o = {16'b0, reg2_i[7:0], 8'b0}; end
                            2'b10: begin mem_mask_o = 4'b0100; mem_wdata_o = {8'b0, reg2_i[7:0], 16'b0}; end
                            2'b11: begin mem_mask_o = 4'b1000; mem_wdata_o = {reg2_i[7:0], 24'b0}; end
                        endcase
                    end
                    3'b001: begin // SH
                        if (mem_addr_o[1:0] == 2'b00) begin
                            mem_mask_o = 4'b0011; mem_wdata_o = {16'b0, reg2_i[15:0]};
                        end else if (mem_addr_o[1:0] == 2'b10) begin
                            mem_mask_o = 4'b1100; mem_wdata_o = {reg2_i[15:0], 16'b0};
                        end else begin
                            mem_mask_o = 4'b0000; mem_wdata_o = 32'b0; // misaligned
                        end
                    end
                    3'b010: begin // SW
                        mem_mask_o = 4'b1111;
                        mem_wdata_o = reg2_i;
                    end
                    default: begin
                        mem_mask_o = 4'b0000;
                        mem_wdata_o = 32'b0;
                    end
                endcase
            end
            7'b1100011: begin // Branch
                logic take_branch;
                unique case (funct3)
                    3'b000: take_branch = (reg1_i == reg2_i);      // BEQ
                    3'b001: take_branch = (reg1_i != reg2_i);      // BNE
                    3'b100: take_branch = ($signed(reg1_i) < $signed(reg2_i)); // BLT
                    3'b101: take_branch = ($signed(reg1_i) >= $signed(reg2_i)); // BGE
                    3'b110: take_branch = (reg1_i < reg2_i);       // BLTU
                    3'b111: take_branch = (reg1_i >= reg2_i);      // BGEU
                    default: take_branch = 1'b0;
                endcase
                if (take_branch) begin
                    jump_flag_o = 1'b1;
                    jump_addr_o = inst_addr_i + imm_i;
                end
                reg_we_o = 1'b0;
            end
            7'b1101111: begin // JAL
                jump_flag_o = 1'b1;
                jump_addr_o = inst_addr_i + imm_i;
                ex_result_o = inst_addr_i + 32'd4; // return addr
            end
            7'b1100111: begin // JALR
                jump_flag_o = 1'b1;
                jump_addr_o = (reg1_i + imm_i) & ~32'd1;
                ex_result_o = inst_addr_i + 32'd4;
            end
            7'b0110111: begin // LUI
                ex_result_o = imm_i;
            end
            7'b0010111: begin // AUIPC
                ex_result_o = inst_addr_i + imm_i;
            end
            default: ;
        endcase
    end

endmodule
