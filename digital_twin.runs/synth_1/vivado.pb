
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:022

00:00:062	
567.3092	
185.645Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/utils_1/imports/synth_1/top.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2m
kC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/utils_1/imports/synth_1/top.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
_
Command: %s
53*	vivadotcl2.
,synth_design -top top -part xc7k325tffg900-2Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
{
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2

xc7k325tZ17-347h px� 
k
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2

xc7k325tZ17-349h px� 
E
Loading part %s157*device2
xc7k325tffg900-2Z21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
M
#Helper process launched with PID %s4824*oasys2
3528Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:01 ; elapsed = 00:00:04 . Memory (MB): peak = 1472.531 ; gain = 440.855
h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
int_i2
wire2f
bC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/myCPU.sv2
2318@Z8-11241h px� 
�
.identifier '%s' is used before its declaration4750*oasys2
	ie_inst_o2f
bC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/myCPU.sv2
468@Z8-6901h px� 
�
.identifier '%s' is used before its declaration4750*oasys2
ie_inst_addr_o2f
bC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/myCPU.sv2
478@Z8-6901h px� 
�
.identifier '%s' is used before its declaration4750*oasys2
ex_reg_we_o2f
bC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/myCPU.sv2
488@Z8-6901h px� 
�
.identifier '%s' is used before its declaration4750*oasys2
ex_reg_waddr_o2f
bC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/myCPU.sv2
498@Z8-6901h px� 
�
.identifier '%s' is used before its declaration4750*oasys2
ex_reg_wdata_o2f
bC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/myCPU.sv2
508@Z8-6901h px� 
�
synthesizing module '%s'%s4497*oasys2
top2
 2d
`C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/top.sv2
238@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
pll2
 2�
|C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.runs/synth_1/.Xil/Vivado-12868-xy/realtime/pll_stub.v2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
pll2
 2
02
12�
|C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.runs/synth_1/.Xil/Vivado-12868-xy/realtime/pll_stub.v2
68@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
uart2
 2e
aC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/uart.sv2
228@Z8-6157h px� 
R
%s
*synth2:
8	Parameter CLK_FREQ bound to: 50000000 - type: integer 
h p
x
� 
O
%s
*synth27
5	Parameter BAUD_RATE bound to: 9600 - type: integer 
h p
x
� 
�
default block is never used226*oasys2e
aC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/uart.sv2
728@Z8-226h px� 
�
-case statement is not full and has no default155*oasys2e
aC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/uart.sv2
1478@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
uart2
 2
02
12e
aC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/uart.sv2
228@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
twin_controller2
 2p
lC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/twin_controller.sv2
238@Z8-6157h px� 
�
default block is never used226*oasys2p
lC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/twin_controller.sv2
648@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
twin_controller2
 2
02
12p
lC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/twin_controller.sv2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
student_top2
 2l
hC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/student_top.sv2
238@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
myCPU2
 2f
bC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/myCPU.sv2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
pc_reg2
 2f
bC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/pc_reg.v2
58@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
pc_reg2
 2
02
12f
bC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/pc_reg.v2
58@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ctrl2
 2d
`C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/ctrl.v2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ctrl2
 2
02
12d
`C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/ctrl.v2
68@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
regs2
 2d
`C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/regs.v2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
regs2
 2
02
12d
`C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/regs.v2
68@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
if_id2
 2e
aC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/if_id.v2
68@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
gen_pipe_dff2
 2g
cC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/gen_dff.v2
38@Z8-6157h px� 
F
%s
*synth2.
,	Parameter DW bound to: 32 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
gen_pipe_dff2
 2
02
12g
cC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/gen_dff.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
gen_pipe_dff__parameterized02
 2g
cC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/gen_dff.v2
38@Z8-6157h px� 
E
%s
*synth2-
+	Parameter DW bound to: 8 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
gen_pipe_dff__parameterized02
 2
02
12g
cC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/gen_dff.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
if_id2
 2
02
12e
aC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/if_id.v2
68@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
id2
 2b
^C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/id.v2
68@Z8-6157h px� 
�
default block is never used226*oasys2b
^C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/id.v2
728@Z8-226h px� 
�
default block is never used226*oasys2b
^C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/id.v2
918@Z8-226h px� 
�
default block is never used226*oasys2b
^C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/id.v2
1088@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
id2
 2
02
12b
^C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/id.v2
68@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
id_ex2
 2e
aC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/id_ex.v2
58@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
gen_pipe_dff__parameterized12
 2g
cC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/gen_dff.v2
38@Z8-6157h px� 
E
%s
*synth2-
+	Parameter DW bound to: 1 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
gen_pipe_dff__parameterized12
 2
02
12g
cC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/gen_dff.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
gen_pipe_dff__parameterized22
 2g
cC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/gen_dff.v2
38@Z8-6157h px� 
E
%s
*synth2-
+	Parameter DW bound to: 5 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
gen_pipe_dff__parameterized22
 2
02
12g
cC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/gen_dff.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
id_ex2
 2
02
12e
aC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/id_ex.v2
58@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ex2
 2b
^C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/ex.v2
68@Z8-6157h px� 
�
default block is never used226*oasys2b
^C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/ex.v2
2458@Z8-226h px� 
�
default block is never used226*oasys2b
^C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/ex.v2
3448@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ex2
 2
02
12b
^C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/ex.v2
68@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
div2
 2c
_C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/div.v2
88@Z8-6157h px� 
�
-case statement is not full and has no default155*oasys2c
_C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/div.v2
738@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
div2
 2
02
12c
_C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/div.v2
88@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
myCPU2
 2
02
12f
bC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/myCPU.sv2
38@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
debug_wb_have_inst2
myCPU2

Core_cpu2l
hC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/student_top.sv2
528@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
debug_wb_pc2
myCPU2

Core_cpu2l
hC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/student_top.sv2
528@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
debug_wb_ena2
myCPU2

Core_cpu2l
hC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/student_top.sv2
528@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
debug_wb_reg2
myCPU2

Core_cpu2l
hC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/student_top.sv2
528@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
debug_wb_value2
myCPU2

Core_cpu2l
hC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/student_top.sv2
528@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2

Core_cpu2
myCPU2
142
92l
hC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/student_top.sv2
528@Z8-7023h px� 
�
synthesizing module '%s'%s4497*oasys2
IROM2
 2�
}C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.runs/synth_1/.Xil/Vivado-12868-xy/realtime/IROM_stub.v2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
IROM2
 2
02
12�
}C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.runs/synth_1/.Xil/Vivado-12868-xy/realtime/IROM_stub.v2
68@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
perip_bridge2
 2m
iC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/perip_bridge.sv2
228@Z8-6157h px� 
�
-case statement is not full and has no default155*oasys2m
iC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/perip_bridge.sv2
568@Z8-155h px� 
�
synthesizing module '%s'%s4497*oasys2
display_seg2
 2l
hC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/display_seg.sv2
238@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
seg72
 2e
aC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/seg7.sv2
238@Z8-6157h px� 
�
default block is never used226*oasys2e
aC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/seg7.sv2
298@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
seg72
 2
02
12e
aC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/seg7.sv2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
display_seg2
 2
02
12l
hC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/display_seg.sv2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
dram_driver2
 2l
hC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/dram_driver.sv2
238@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
DRAM2
 2�
}C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.runs/synth_1/.Xil/Vivado-12868-xy/realtime/DRAM_stub.v2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
DRAM2
 2
02
12�
}C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.runs/synth_1/.Xil/Vivado-12868-xy/realtime/DRAM_stub.v2
68@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
dram_driver2
 2
02
12l
hC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/dram_driver.sv2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
counter2
 2h
dC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/counter.sv2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
counter2
 2
02
12h
dC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/counter.sv2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
perip_bridge2
 2
02
12m
iC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/perip_bridge.sv2
228@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
student_top2
 2
02
12l
hC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/student_top.sv2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
top2
 2
02
12d
`C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/top.sv2
238@Z8-6155h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
int_i2
myCPU2f
bC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/sources_1/new/myCPU.sv2
2318@Z8-3848h px� 
h
9Port %s in module %s is either unconnected or has no load4866*oasys2
rst2
exZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

inst_i[19]2
exZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

inst_i[18]2
exZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

inst_i[17]2
exZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

inst_i[16]2
exZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

inst_i[15]2
exZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

inst_i[11]2
exZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

inst_i[10]2
exZ8-7129h px� 
n
9Port %s in module %s is either unconnected or has no load4866*oasys2
	inst_i[9]2
exZ8-7129h px� 
n
9Port %s in module %s is either unconnected or has no load4866*oasys2
	inst_i[8]2
exZ8-7129h px� 
n
9Port %s in module %s is either unconnected or has no load4866*oasys2
	inst_i[7]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[31]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[30]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[29]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[28]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[27]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[26]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[25]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[24]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[23]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[22]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[21]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[20]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[19]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[18]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[17]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[16]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[15]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[14]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[13]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[12]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[11]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[10]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[9]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[8]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[7]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[6]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[5]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[4]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[3]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[2]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[1]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[0]2
exZ8-7129h px� 
h
9Port %s in module %s is either unconnected or has no load4866*oasys2
rst2
idZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
ex_jump_flag_i2
idZ8-7129h px� 
j
9Port %s in module %s is either unconnected or has no load4866*oasys2
rst2
ctrlZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:01 ; elapsed = 00:00:05 . Memory (MB): peak = 1596.051 ; gain = 564.375
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:01 ; elapsed = 00:00:05 . Memory (MB): peak = 1596.051 ; gain = 564.375
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:01 ; elapsed = 00:00:05 . Memory (MB): peak = 1596.051 ; gain = 564.375
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0522

1596.0512
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2y
uc:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.gen/sources_1/ip/IROM/IROM/IROM_in_context.xdc2
student_top_inst/Mem_IROM	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2y
uc:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.gen/sources_1/ip/IROM/IROM/IROM_in_context.xdc2
student_top_inst/Mem_IROM	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2y
uc:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.gen/sources_1/ip/DRAM/DRAM/DRAM_in_context.xdc2:
6student_top_inst/bridge_inst/dram_driver_inst/Mem_DRAM	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2y
uc:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.gen/sources_1/ip/DRAM/DRAM/DRAM_in_context.xdc2:
6student_top_inst/bridge_inst/dram_driver_inst/Mem_DRAM	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2v
rc:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.gen/sources_1/ip/pll/pll/pll_in_context.xdc2
pll_inst	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2v
rc:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.gen/sources_1/ip/pll/pll/pll_in_context.xdc2
pll_inst	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2n
jC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/constrs_1/new/digital_twin.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2n
jC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/constrs_1/new/digital_twin.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2l
jC:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.srcs/constrs_1/new/digital_twin.xdc2
.Xil/top_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1680.9142
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0092

1680.9142
0.000Z17-268h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.00028
6student_top_inst/bridge_inst/dram_driver_inst/Mem_DRAM2
clk2
10.000Z38-316h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:03 ; elapsed = 00:00:12 . Memory (MB): peak = 1684.555 ; gain = 652.879
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Loading part: xc7k325tffg900-2
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:03 ; elapsed = 00:00:12 . Memory (MB): peak = 1684.555 ; gain = 652.879
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:03 ; elapsed = 00:00:12 . Memory (MB): peak = 1684.555 ; gain = 652.879
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
k
3inferred FSM for state register '%s' in module '%s'802*oasys2
rx_state_reg2
uartZ8-802h px� 
k
3inferred FSM for state register '%s' in module '%s'802*oasys2
tx_state_reg2
uartZ8-802h px� 
g
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2
divZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                  iSTATE |                               00 |                               00
h p
x
� 
y
%s
*synth2a
_                 iSTATE0 |                               01 |                               01
h p
x
� 
y
%s
*synth2a
_                 iSTATE1 |                               10 |                               10
h p
x
� 
y
%s
*synth2a
_                 iSTATE2 |                               11 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
rx_state_reg2

sequential2
uartZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                  iSTATE |                                0 |                             0000
h p
x
� 
y
%s
*synth2a
_                 iSTATE0 |                                1 |                             0001
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
tx_state_reg2

sequential2
uartZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 

%s
*synth2
*
h p
x
� 
y
%s
*synth2a
_              STATE_IDLE |                             0001 |                             0001
h p
x
� 
y
%s
*synth2a
_             STATE_START |                             0010 |                             0010
h p
x
� 
y
%s
*synth2a
_              STATE_CALC |                             0100 |                             0100
h p
x
� 
y
%s
*synth2a
_               STATE_END |                             1000 |                             1000
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
l
6No Re-encoding of one hot register '%s' in module '%s'3445*oasys2
	state_reg2
divZ8-3898h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:13 . Memory (MB): peak = 1684.555 ; gain = 652.879
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   64 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 11    
h p
x
� 
F
%s
*synth2.
,	   3 Input   32 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   13 Bit       Adders := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 2     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input     32 Bit         XORs := 1     
h p
x
� 
H
%s
*synth20
.	   2 Input      1 Bit         XORs := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               64 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 20    
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               13 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               10 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 23    
h p
x
� 
H
%s
*synth20
.	                5 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 15    
h p
x
� 
&
%s
*synth2
+---RAMs : 
h p
x
� 
W
%s
*synth2?
=	             1024 Bit	(32 X 32 bit)          RAMs := 1     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   64 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit        Muxes := 66    
h p
x
� 
F
%s
*synth2.
,	   8 Input   32 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  12 Input   32 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   6 Input   32 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input   32 Bit        Muxes := 9     
h p
x
� 
F
%s
*synth2.
,	  10 Input   32 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   5 Input   32 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	   2 Input   31 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   13 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   4 Input   13 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   4 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit        Muxes := 20    
h p
x
� 
F
%s
*synth2.
,	   4 Input    5 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 6     
h p
x
� 
F
%s
*synth2.
,	   5 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  12 Input    3 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	  10 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  12 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   6 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  10 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 39    
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	   3 Input    1 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	  12 Input    1 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  10 Input    1 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   6 Input    1 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   5 Input    1 Bit        Muxes := 13    
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
s
%s
*synth2[
YPart Resources:
DSPs: 840 (col length:140)
BRAMs: 890 (col length: RAMB18 140 RAMB36 70)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
W
%s
*synth2?
=DSP Report: Generating DSP mul_temp, operation Mode is: A*B.
h p
x
� 
W
%s
*synth2?
=DSP Report: operator mul_temp is absorbed into DSP mul_temp.
h p
x
� 
W
%s
*synth2?
=DSP Report: operator mul_temp is absorbed into DSP mul_temp.
h p
x
� 
b
%s
*synth2J
HDSP Report: Generating DSP mul_temp, operation Mode is: (PCIN>>17)+A*B.
h p
x
� 
W
%s
*synth2?
=DSP Report: operator mul_temp is absorbed into DSP mul_temp.
h p
x
� 
W
%s
*synth2?
=DSP Report: operator mul_temp is absorbed into DSP mul_temp.
h p
x
� 
W
%s
*synth2?
=DSP Report: Generating DSP mul_temp, operation Mode is: A*B.
h p
x
� 
W
%s
*synth2?
=DSP Report: operator mul_temp is absorbed into DSP mul_temp.
h p
x
� 
W
%s
*synth2?
=DSP Report: operator mul_temp is absorbed into DSP mul_temp.
h p
x
� 
b
%s
*synth2J
HDSP Report: Generating DSP mul_temp, operation Mode is: (PCIN>>17)+A*B.
h p
x
� 
W
%s
*synth2?
=DSP Report: operator mul_temp is absorbed into DSP mul_temp.
h p
x
� 
W
%s
*synth2?
=DSP Report: operator mul_temp is absorbed into DSP mul_temp.
h p
x
� 
h
9Port %s in module %s is either unconnected or has no load4866*oasys2
rst2
exZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

inst_i[19]2
exZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

inst_i[18]2
exZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

inst_i[17]2
exZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

inst_i[16]2
exZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

inst_i[15]2
exZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

inst_i[11]2
exZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

inst_i[10]2
exZ8-7129h px� 
n
9Port %s in module %s is either unconnected or has no load4866*oasys2
	inst_i[9]2
exZ8-7129h px� 
n
9Port %s in module %s is either unconnected or has no load4866*oasys2
	inst_i[8]2
exZ8-7129h px� 
n
9Port %s in module %s is either unconnected or has no load4866*oasys2
	inst_i[7]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[31]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[30]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[29]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[28]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[27]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[26]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[25]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[24]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[23]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[22]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[21]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[20]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[19]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[18]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[17]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[16]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[15]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[14]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[13]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[12]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[11]2
exZ8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[10]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[9]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[8]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[7]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[6]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[5]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[4]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[3]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[2]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[1]2
exZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
inst_addr_i[0]2
exZ8-7129h px� 
h
9Port %s in module %s is either unconnected or has no load4866*oasys2
rst2
idZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
ex_jump_flag_i2
idZ8-7129h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:10 ; elapsed = 00:00:28 . Memory (MB): peak = 1684.555 ; gain = 652.879
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
V
%s
*synth2>
< Sort Area is  mul_temp_0 : 0 0 : 2701 5044 : Used 1 time 0
h p
x
� 
V
%s
*synth2>
< Sort Area is  mul_temp_0 : 0 1 : 2343 5044 : Used 1 time 0
h p
x
� 
V
%s
*synth2>
< Sort Area is  mul_temp_3 : 0 0 : 2339 4365 : Used 1 time 0
h p
x
� 
V
%s
*synth2>
< Sort Area is  mul_temp_3 : 0 1 : 2026 4365 : Used 1 time 0
h p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
X
%s*synth2@
>
Distributed RAM: Preliminary Mapping Report (see note below)
h px� 
{
%s*synth2c
a+--------------------------+-----------------+-----------+----------------------+--------------+
h px� 
|
%s*synth2d
b|Module Name               | RTL Object      | Inference | Size (Depth x Width) | Primitives   | 
h px� 
{
%s*synth2c
a+--------------------------+-----------------+-----------+----------------------+--------------+
h px� 
|
%s*synth2d
b|student_top_inst/Core_cpu | u_regs/regs_reg | Implied   | 32 x 32              | RAM32M x 12  | 
h px� 
|
%s*synth2d
b+--------------------------+-----------------+-----------+----------------------+--------------+

h px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the Distributed RAMs at the current stage of the synthesis flow. Some Distributed RAMs may be reimplemented as non Distributed RAM primitives later in the synthesis flow. Multiple instantiated RAMs are reported only once.
h px� 
v
%s*synth2^
\
DSP: Preliminary Mapping Report (see note below. The ' indicates corresponding REG is set)
h px� 
�
%s*synth2�
+------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h px� 
�
%s*synth2�
�|Module Name | DSP Mapping    | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
h px� 
�
%s*synth2�
+------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h px� 
�
%s*synth2�
�|ex          | A*B            | 18     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|ex          | (PCIN>>17)+A*B | 16     | 16     | -      | -      | 30     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|ex          | A*B            | 18     | 18     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|ex          | (PCIN>>17)+A*B | 18     | 16     | -      | -      | 47     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�+------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

h px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the DSPs inferred at the current stage of the synthesis flow. Some DSP may be reimplemented as non DSP primitives later in the synthesis flow. Multiple instantiated DSPs are reported only once.
h px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:11 ; elapsed = 00:00:34 . Memory (MB): peak = 1684.555 ; gain = 652.879
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:15 ; elapsed = 00:00:43 . Memory (MB): peak = 1784.301 ; gain = 752.625
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
A
%s
*synth2)
'
Distributed RAM: Final Mapping Report
h p
x
� 
{
%s
*synth2c
a+--------------------------+-----------------+-----------+----------------------+--------------+
h p
x
� 
|
%s
*synth2d
b|Module Name               | RTL Object      | Inference | Size (Depth x Width) | Primitives   | 
h p
x
� 
{
%s
*synth2c
a+--------------------------+-----------------+-----------+----------------------+--------------+
h p
x
� 
|
%s
*synth2d
b|student_top_inst/Core_cpu | u_regs/regs_reg | Implied   | 32 x 32              | RAM32M x 12  | 
h p
x
� 
|
%s
*synth2d
b+--------------------------+-----------------+-----------+----------------------+--------------+

h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:15 ; elapsed = 00:00:44 . Memory (MB): peak = 1789.664 ; gain = 757.988
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:17 ; elapsed = 00:00:47 . Memory (MB): peak = 1803.367 ; gain = 771.691
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:17 ; elapsed = 00:00:47 . Memory (MB): peak = 1803.367 ; gain = 771.691
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:17 ; elapsed = 00:00:47 . Memory (MB): peak = 1803.367 ; gain = 771.691
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:17 ; elapsed = 00:00:47 . Memory (MB): peak = 1803.367 ; gain = 771.691
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:17 ; elapsed = 00:00:48 . Memory (MB): peak = 1803.367 ; gain = 771.691
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:17 ; elapsed = 00:00:48 . Memory (MB): peak = 1803.367 ; gain = 771.691
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
W
%s
*synth2?
=
DSP Final Report (the ' indicates corresponding REG is set)
h p
x
� 
�
%s
*synth2
}+------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h p
x
� 
�
%s
*synth2�
~|Module Name | DSP Mapping  | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
h p
x
� 
�
%s
*synth2
}+------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h p
x
� 
�
%s
*synth2�
~|ex          | A*B          | 17     | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
~|ex          | PCIN>>17+A*B | 15     | 15     | -      | -      | 30     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
~|ex          | A*B          | 17     | 17     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
~|ex          | PCIN>>17+A*B | 17     | 15     | -      | -      | 47     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
~+------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|      |BlackBox name |Instances |
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|1     |pll           |         1|
h p
x
� 
=
%s
*synth2%
#|2     |IROM          |         1|
h p
x
� 
=
%s
*synth2%
#|3     |DRAM          |         1|
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
4
%s*synth2
+------+---------+------+
h px� 
4
%s*synth2
|      |Cell     |Count |
h px� 
4
%s*synth2
+------+---------+------+
h px� 
4
%s*synth2
|1     |DRAM     |     1|
h px� 
4
%s*synth2
|2     |IROM     |     1|
h px� 
4
%s*synth2
|3     |pll      |     1|
h px� 
4
%s*synth2
|4     |CARRY4   |   154|
h px� 
4
%s*synth2
|5     |DSP48E1  |     4|
h px� 
4
%s*synth2
|6     |LUT1     |   262|
h px� 
4
%s*synth2
|7     |LUT2     |   381|
h px� 
4
%s*synth2
|8     |LUT3     |   166|
h px� 
4
%s*synth2
|9     |LUT4     |   420|
h px� 
4
%s*synth2
|10    |LUT5     |   218|
h px� 
4
%s*synth2
|11    |LUT6     |  1166|
h px� 
4
%s*synth2
|12    |MUXF7    |    17|
h px� 
4
%s*synth2
|13    |MUXF8    |     8|
h px� 
4
%s*synth2
|14    |RAM32M   |    10|
h px� 
4
%s*synth2
|15    |RAM32X1D |     4|
h px� 
4
%s*synth2
|16    |FDCE     |   296|
h px� 
4
%s*synth2
|17    |FDPE     |    13|
h px� 
4
%s*synth2
|18    |FDRE     |   647|
h px� 
4
%s*synth2
|19    |FDSE     |    10|
h px� 
4
%s*synth2
|20    |IBUF     |     1|
h px� 
4
%s*synth2
|21    |OBUF     |    73|
h px� 
4
%s*synth2
+------+---------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:17 ; elapsed = 00:00:48 . Memory (MB): peak = 1803.367 ; gain = 771.691
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
a
%s
*synth2I
GSynthesis finished with 0 errors, 0 critical warnings and 46 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:15 ; elapsed = 00:00:46 . Memory (MB): peak = 1803.367 ; gain = 683.188
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:17 ; elapsed = 00:00:48 . Memory (MB): peak = 1803.367 ; gain = 771.691
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0522

1815.3832
0.000Z17-268h px� 
U
-Analyzing %s Unisim elements for replacement
17*netlist2
197Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1823.0622
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2�
�  A total of 14 instances were transformed.
  RAM32M => RAM32M (RAMD32(x6), RAMS32(x2)): 10 instances
  RAM32X1D => RAM32X1D (RAMD32(x2)): 4 instances
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

72e435e3Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
892
1052
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:182

00:00:532

1823.0622

1243.836Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0042

1823.0622
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2]
[C:/Users/xy/Desktop/PRO/resource/JYD2025_Contest-Template/digital_twin.runs/synth_1/top.dcpZ17-1381h px� 
z
%s4*runtcl2^
\Executing : report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sun May 18 18:20:30 2025Z17-206h px� 


End Record