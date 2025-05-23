#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2023.2 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : AMD Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Wed Apr 23 16:29:45 CST 2025
# SW Build 4029153 on Fri Oct 13 20:13:54 MDT 2023
#
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim tb_myCPU_behav -key {Behavioral:sim_1:Functional:tb_myCPU} -tclbatch tb_myCPU.tcl -view /home/ketted/Desktop/JYD2025_Contest/tb_uart_behav.wcfg -view /home/ketted/Desktop/JYD2025_Contest/tb_top_behav.wcfg -view /home/ketted/Desktop/JYD2025_Contest/tb_myCPU_behav.wcfg -log simulate.log"
xsim tb_myCPU_behav -key {Behavioral:sim_1:Functional:tb_myCPU} -tclbatch tb_myCPU.tcl -view /home/ketted/Desktop/JYD2025_Contest/tb_uart_behav.wcfg -view /home/ketted/Desktop/JYD2025_Contest/tb_top_behav.wcfg -view /home/ketted/Desktop/JYD2025_Contest/tb_myCPU_behav.wcfg -log simulate.log

