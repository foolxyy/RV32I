// if_id.sv
// IF/ID pipeline register module

module if_id (
    input  logic        clk,
    input  logic        rst,
    input  logic        flush_i,        // Control: flush (e.g., jump mispredict)
    input  logic        hold_flag_i,    // Control: pipeline stall
    input  logic [31:0] inst_i,         // Instruction from IF stage
    input  logic [31:0] inst_addr_i,    // PC value from IF stage
    output logic [31:0] inst_o,         // Instruction to ID stage
    output logic [31:0] inst_addr_o     // PC value to ID stage
);

    localparam [31:0] NOP_INST = 32'h00000013; // ADDI x0, x0, 0

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            inst_o      <= NOP_INST;
            inst_addr_o <= 32'b0;
        end else if (flush_i) begin
            inst_o      <= NOP_INST;
            inst_addr_o <= 32'b0;
        end else if (hold_flag_i) begin
            // Maintain current value during stall
            inst_o      <= inst_o;
            inst_addr_o <= inst_addr_o;
        end else begin
            inst_o      <= inst_i;
            inst_addr_o <= inst_addr_i;
        end
    end

endmodule
