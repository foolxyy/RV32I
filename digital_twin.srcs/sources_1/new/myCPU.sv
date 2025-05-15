// myCPU.sv
// Top-level module that integrates the modified tinyriscv-based core to match contest interface

module myCPU (
    input  logic         cpu_clk,
    input  logic         cpu_rst,

    // IROM interface
    output logic [31:0] irom_addr,
    input  logic [31:0] irom_data,

    // DRAM/Peripheral interface
    output logic [31:0] perip_addr,
    output logic        perip_wen,
    output logic [3:0]  perip_mask,
    output logic [31:0] perip_wdata,
    input  logic [31:0] perip_rdata
);

    // Internal wires between modules
    logic [31:0] pc_current;
    logic        jump_flag;
    logic [31:0] jump_addr;
    logic        stall;

    logic [31:0] inst_ifid, pc_ifid;
    logic        flush_ifid;

    logic [4:0] rs1_id, rs2_id, rd_id;
    logic [31:0] reg1_id, reg2_id, imm_id;
    logic        reg_we_id;
    logic        stall_id;

    logic [31:0] inst_idex, pc_idex;
    logic [31:0] reg1_ex, reg2_ex, imm_ex;
    logic [4:0]  rd_ex;
    logic        reg_we_ex;

    logic        jump_flag_ex;
    logic [31:0] jump_addr_ex;
    logic [31:0] alu_result_ex;
    logic [3:0]  mask_ex;
    logic [31:0] wdata_ex;

    logic        reg_we_mem;
    logic [4:0]  rd_mem;
    logic [31:0] wdata_mem;

    // PC
    pc_reg u_pc (
        .clk(cpu_clk), .rst(cpu_rst), .jump_flag_i(jump_flag_ex),
        .jump_addr_i(jump_addr_ex), .hold_flag_i(stall), .pc_o(pc_current)
    );

    assign irom_addr = pc_current;

    // IF/ID
    if_id u_if_id (
        .clk(cpu_clk), .rst(cpu_rst), .flush_i(jump_flag_ex), .hold_flag_i(stall),
        .inst_i(irom_data), .inst_addr_i(pc_current), .inst_o(inst_ifid), .inst_addr_o(pc_ifid)
    );

    // ID
    id u_id (
        .rst(cpu_rst), .inst_i(inst_ifid), .inst_addr_i(pc_ifid),
        .rdata1_i(reg1_id), .rdata2_i(reg2_id),
        .ex_rd_i(rd_ex), .ex_reg_we_i(reg_we_ex), .mem_rd_i(rd_mem), .mem_reg_we_i(reg_we_mem),
        .rs1_o(rs1_id), .rs2_o(rs2_id), .rd_o(rd_id), .reg_we_o(reg_we_id),
        .imm_o(imm_id), .reg1_o(reg1_id), .reg2_o(reg2_id),
        .inst_o(inst_idex), .inst_addr_o(pc_idex), .stall_req_o(stall_id)
    );

    assign stall = stall_id;

    // Registers
    regs u_regs (
        .clk(cpu_clk), .rst(cpu_rst), .we_i(reg_we_mem),
        .waddr_i(rd_mem), .wdata_i(wdata_mem),
        .raddr1_i(rs1_id), .raddr2_i(rs2_id),
        .rdata1_o(reg1_id), .rdata2_o(reg2_id)
    );

    // ID/EX
    id_ex u_id_ex (
        .clk(cpu_clk), .rst(cpu_rst), .flush_i(jump_flag_ex),
        .inst_i(inst_idex), .inst_addr_i(pc_idex), .reg1_i(reg1_id), .reg2_i(reg2_id),
        .imm_i(imm_id), .rd_i(rd_id), .reg_we_i(reg_we_id),
        .inst_o(inst_idex), .inst_addr_o(pc_idex), .reg1_o(reg1_ex), .reg2_o(reg2_ex),
        .imm_o(imm_ex), .rd_o(rd_ex), .reg_we_o(reg_we_ex)
    );

    // EX
    ex u_ex (
        .clk(cpu_clk), .rst(cpu_rst),
        .inst_i(inst_idex), .inst_addr_i(pc_idex),
        .reg1_i(reg1_ex), .reg2_i(reg2_ex), .imm_i(imm_ex),
        .rd_i(rd_ex), .reg_we_i(reg_we_ex),
        .jump_flag_o(jump_flag_ex), .jump_addr_o(jump_addr_ex),
        .ex_result_o(alu_result_ex), .rd_o(rd_ex), .reg_we_o(reg_we_ex),
        .mem_addr_o(perip_addr), .mem_wen_o(perip_wen), .mem_mask_o(perip_mask), .mem_wdata_o(perip_wdata),
        .inst_o(inst_idex)
    );

    // MEM
    mem u_mem (
        .clk(cpu_clk), .rst(cpu_rst),
        .inst_i(inst_idex), .rd_i(rd_ex), .reg_we_i(reg_we_ex),
        .ex_result_i(alu_result_ex), .mem_addr_i(perip_addr), .mem_wen_i(perip_wen),
        .mem_mask_i(perip_mask), .mem_wdata_i(perip_wdata), .perip_rdata(perip_rdata),
        .perip_addr(), .perip_wen(), .perip_mask(), .perip_wdata(),
        .reg_we_o(reg_we_mem), .reg_waddr_o(rd_mem), .reg_wdata_o(wdata_mem)
    );

endmodule
