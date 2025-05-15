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
    logic [31:0] pc_current, pc_next, pc_ifid, inst_ifid;
    logic        stall_pc, flush_ifid;

    // Instantiate PC register
    pc_reg u_pc_reg (
        .clk(cpu_clk),
        .rst(cpu_rst),
        .stall(stall_pc),
        .jump_en(jump_en_ex),
        .jump_addr(jump_addr_ex),
        .pc_out(pc_current)
    );

    assign irom_addr = pc_current;

    // IF/ID pipeline register
    if_id u_if_id (
        .clk(cpu_clk),
        .rst(cpu_rst),
        .flush(flush_ifid),
        .stall(stall_ifid),
        .pc_in(pc_current),
        .inst_in(irom_data),
        .pc_out(pc_ifid),
        .inst_out(inst_ifid)
    );

    // ID stage
    logic [4:0] rs1_id, rs2_id, rd_id;
    logic [31:0] imm_id, op1_id, op2_id;
    logic        reg_write_id, mem_read_id, mem_write_id;
    logic [2:0]  funct3_id;

    id u_id (
        .clk(cpu_clk),
        .rst(cpu_rst),
        .inst(inst_ifid),
        .pc(pc_ifid),
        .rs1_id(rs1_id),
        .rs2_id(rs2_id),
        .rd_id(rd_id),
        .imm(imm_id),
        .op1(op1_id),
        .op2(op2_id),
        .funct3(funct3_id),
        .reg_write(reg_write_id),
        .mem_read(mem_read_id),
        .mem_write(mem_write_id)
    );

    // EX stage (ALU, branching, perip signals)
    logic jump_en_ex;
    logic [31:0] jump_addr_ex, alu_result_ex, wdata_ex;
    logic [3:0]  mask_ex;

    ex u_ex (
        .clk(cpu_clk),
        .rst(cpu_rst),
        .op1(op1_id),
        .op2(op2_id),
        .imm(imm_id),
        .funct3(funct3_id),
        .mem_read(mem_read_id),
        .mem_write(mem_write_id),
        .rs2_val(rs2_val_id),
        .alu_result(alu_result_ex),
        .wdata(wdata_ex),
        .mask(mask_ex),
        .jump_en(jump_en_ex),
        .jump_addr(jump_addr_ex)
    );

    assign perip_addr  = alu_result_ex;
    assign perip_wen   = mem_write_id;
    assign perip_wdata = wdata_ex;
    assign perip_mask  = mask_ex;

    // MEM stage (load data selection and extension)
    logic [31:0] load_data_mem;

    mem u_mem (
        .clk(cpu_clk),
        .rst(cpu_rst),
        .perip_rdata(perip_rdata),
        .funct3(funct3_id),
        .addr(alu_result_ex),
        .load_data(load_data_mem)
    );

    // WB stage (reg write-back)
    logic [31:0] wb_data;
    assign wb_data = mem_read_id ? load_data_mem : alu_result_ex;

    regs u_regs (
        .clk(cpu_clk),
        .rst(cpu_rst),
        .rs1(rs1_id),
        .rs2(rs2_id),
        .rd(rd_id),
        .wdata(wb_data),
        .reg_write(reg_write_id),
        .rs1_val(rs1_val_id),
        .rs2_val(rs2_val_id)
    );

endmodule
