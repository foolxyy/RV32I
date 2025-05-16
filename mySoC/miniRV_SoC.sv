// miniRV_SoC.sv
// SoC top module that connects myCPU with IROM and DRAM, and exposes debug interface

module miniRV_SoC (
    input  logic         fpga_rst,
    input  logic         fpga_clk,

    output logic         debug_wb_have_inst,
    output logic [31:0]  debug_wb_pc,
    output logic         debug_wb_ena,
    output logic [4:0]   debug_wb_reg,
    output logic [31:0]  debug_wb_value
);

    logic        cpu_clk = fpga_clk;

    // Interface wires for IROM (Instruction Memory)
    logic [31:0] irom_addr;
    logic [31:0] irom_data;

    // Interface wires for DRAM (Data Memory)
    logic [31:0] dram_addr;
    logic        dram_we;
    logic [3:0]  dram_sel;
    logic [31:0] dram_wdata;
    logic [31:0] dram_rdata;

    // Instantiate myCPU core (IM/DM excluded)
    myCPU Core_cpu (
        .cpu_rst             (fpga_rst),
        .cpu_clk             (cpu_clk),

        // IROM interface
        .irom_addr           (irom_addr),
        .irom_data           (irom_data),

        // DRAM interface
        .dram_addr           (dram_addr),
        .dram_we             (dram_we),
        .dram_sel            (dram_sel),
        .dram_wdata          (dram_wdata),
        .dram_rdata          (dram_rdata),

        // Debug signals
        .debug_wb_have_inst  (debug_wb_have_inst),
        .debug_wb_pc         (debug_wb_pc),
        .debug_wb_ena        (debug_wb_ena),
        .debug_wb_reg        (debug_wb_reg),
        .debug_wb_value      (debug_wb_value)
    );

    // Instantiate instruction memory (IROM, 32-bit word-addressable ROM)
    IROM Mem_IROM (
        .a    (irom_addr[15:2]), // Address in word units
        .spo  (irom_data)
    );

    // Instantiate data memory (DRAM, 32-bit word-addressable RAM with byte mask)
    DRAM Mem_DRAM (
        .clk  (cpu_clk),
        .a    (dram_addr[15:2]), // Address in word units
        .we   (dram_we),
        .d    (dram_wdata),
        .spo  (dram_rdata)
    );

endmodule