
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a200t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a200t2default:defaultZ17-349h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
�CONFIG_VOLTAGE with Config Bank VCCO: The CONFIG_MODE property of current_design specifies a configuration mode (SPIx4) that uses pins in bank %s.  I/O standards used in this bank have a voltage requirement of 1.80.  However, the CONFIG_VOLTAGE for current_design is set to 3.3.  Ensure that your configuration voltage is compatible with the I/O standards in banks used by your configuration mode.  Refer to device configuration user guide for more information.    Pins used by config mode: V28 (IO_L1P_T0_D00_MOSI_14), V29 (IO_L1N_T0_D01_DIN_14), V26 (IO_L2P_T0_D02_14), V27 (IO_L2N_T0_D03_14), W26 (IO_L3P_T0_DQS_PUDC_B_14), and Y27 (IO_L6P_T0_FCS_B_14)%s*DRC2.
 "
142default:default2default:default2(
 DRC|Pin Planning2default:default8ZCFGBVS-7h px� 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 1 Warnings2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px� 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px� 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px� 
B
-Phase 1 Build RT Design | Checksum: df2ce146
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:53 ; elapsed = 00:01:49 . Memory (MB): peak = 1609.578 ; gain = 127.0312default:defaulth px� 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px� 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px� 
A
,Phase 2.1 Create Timer | Checksum: df2ce146
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:53 ; elapsed = 00:01:50 . Memory (MB): peak = 1609.578 ; gain = 127.0312default:defaulth px� 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px� 
M
8Phase 2.2 Fix Topology Constraints | Checksum: df2ce146
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:53 ; elapsed = 00:01:52 . Memory (MB): peak = 1615.188 ; gain = 132.6412default:defaulth px� 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px� 
F
1Phase 2.3 Pre Route Cleanup | Checksum: df2ce146
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:53 ; elapsed = 00:01:52 . Memory (MB): peak = 1615.188 ; gain = 132.6412default:defaulth px� 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px� 
C
.Phase 2.4 Update Timing | Checksum: 203c6522c
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:54 ; elapsed = 00:01:55 . Memory (MB): peak = 1646.367 ; gain = 163.8202default:defaulth px� 
�
Intermediate Timing Summary %s164*route2K
7| WNS=5.695  | TNS=0.000  | WHS=-1.498 | THS=-202.076|
2default:defaultZ35-416h px� 
}

Phase %s%s
101*constraints2
2.5 2default:default2.
Update Timing for Bus Skew2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
2.5.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 2.5.1 Update Timing | Checksum: 18c8df4b4
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:55 ; elapsed = 00:01:56 . Memory (MB): peak = 1646.367 ; gain = 163.8202default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=5.695  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
P
;Phase 2.5 Update Timing for Bus Skew | Checksum: 20454f992
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:55 ; elapsed = 00:01:57 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
I
4Phase 2 Router Initialization | Checksum: 1831b73a3
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:55 ; elapsed = 00:01:57 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px� 
B
-Phase 3 Initial Routing | Checksum: fbdea46e
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:55 ; elapsed = 00:01:58 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px� 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=3.590  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
H
3Phase 4.1 Global Iteration 0 | Checksum: 1cfbbb405
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:56 ; elapsed = 00:01:59 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
F
1Phase 4 Rip-up And Reroute | Checksum: 1cfbbb405
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:56 ; elapsed = 00:01:59 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px� 
C
.Phase 5.1 Delay CleanUp | Checksum: 1cfbbb405
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:56 ; elapsed = 00:01:59 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px� 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 1cfbbb405
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:56 ; elapsed = 00:01:59 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
O
:Phase 5 Delay and Skew Optimization | Checksum: 1cfbbb405
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:56 ; elapsed = 00:01:59 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 6.1.1 Update Timing | Checksum: 199dabe35
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:56 ; elapsed = 00:01:59 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=3.590  | TNS=0.000  | WHS=-0.321 | THS=-0.494 |
2default:defaultZ35-416h px� 
�

Phase %s%s
101*constraints2
6.1.2 2default:default25
!Lut RouteThru Assignment for hold2default:defaultZ18-101h px� 
Y
DPhase 6.1.2 Lut RouteThru Assignment for hold | Checksum: 1c6b9703b
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:56 ; elapsed = 00:01:59 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
C
.Phase 6.1 Hold Fix Iter | Checksum: 1c6b9703b
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:56 ; elapsed = 00:01:59 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
v

Phase %s%s
101*constraints2
6.2 2default:default2'
Additional Hold Fix2default:defaultZ18-101h px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=3.590  | TNS=0.000  | WHS=-0.321 | THS=-0.494 |
2default:defaultZ35-416h px� 
I
4Phase 6.2 Additional Hold Fix | Checksum: 1c6b9703b
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:56 ; elapsed = 00:01:59 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
A
,Phase 6 Post Hold Fix | Checksum: 19891ba08
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:57 ; elapsed = 00:01:59 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px� 
B
-Phase 7 Route finalize | Checksum: 1491eb796
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:57 ; elapsed = 00:01:59 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px� 
I
4Phase 8 Verifying routed nets | Checksum: 1491eb796
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:57 ; elapsed = 00:01:59 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px� 
E
0Phase 9 Depositing Routes | Checksum: 1088e8986
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:57 ; elapsed = 00:02:00 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
�
�Router was unable to fix hold violation on %s pins. This could be due to a combination of congestion, blockages and run-time limitations. Such pins are:
%s192*route2
22default:default2�
�	u_ila_0/inst/ila_core_inst/shifted_data_in_reg[7][91]_srl8/D
	u_ila_0/inst/ila_core_inst/u_trig/U_TM/N_DDR_MODE.G_NMU[4].U_M/allx_typeA_match_detection.ltlib_v1_0_0_allx_typeA_inst/probeDelay1_reg[0]/D
2default:defaultZ35-459h px� 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px� 
q

Phase %s%s
101*constraints2
10.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
D
/Phase 10.1 Update Timing | Checksum: 14c6e7192
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:57 ; elapsed = 00:02:00 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
�
Estimated Timing Summary %s
57*route2J
6| WNS=3.590  | TNS=0.000  | WHS=-0.321 | THS=-0.494 |
2default:defaultZ35-57h px� 
B
!Router estimated timing not met.
128*routeZ35-328h px� 
G
2Phase 10 Post Router Timing | Checksum: 14c6e7192
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:57 ; elapsed = 00:02:00 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
@
Router Completed Successfully
2*	routeflowZ35-16h px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:57 ; elapsed = 00:02:00 . Memory (MB): peak = 1650.633 ; gain = 168.0862default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
852default:default2
32default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:01:002default:default2
00:02:042default:default2
1650.6332default:default2
168.0862default:defaultZ17-268h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:012default:default2 
00:00:00.4502default:default2
1650.6332default:default2
0.0002default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2}
iD:/Digital Design/Course/session4/Assignment_4/Problem_2/DSP_module/DSP_module.runs/impl_1/DSP_routed.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2r
^Executing : report_drc -file DSP_drc_routed.rpt -pb DSP_drc_routed.pb -rpx DSP_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2e
Qreport_drc -file DSP_drc_routed.rpt -pb DSP_drc_routed.pb -rpx DSP_drc_routed.rpx2default:defaultZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
mD:/Digital Design/Course/session4/Assignment_4/Problem_2/DSP_module/DSP_module.runs/impl_1/DSP_drc_routed.rptmD:/Digital Design/Course/session4/Assignment_4/Problem_2/DSP_module/DSP_module.runs/impl_1/DSP_drc_routed.rpt2default:default8Z2-168h px� 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px� 
�
%s4*runtcl2�
�Executing : report_methodology -file DSP_methodology_drc_routed.rpt -pb DSP_methodology_drc_routed.pb -rpx DSP_methodology_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
}report_methodology -file DSP_methodology_drc_routed.rpt -pb DSP_methodology_drc_routed.pb -rpx DSP_methodology_drc_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px� 
�
2The results of Report Methodology are in file %s.
450*coretcl2�
yD:/Digital Design/Course/session4/Assignment_4/Problem_2/DSP_module/DSP_module.runs/impl_1/DSP_methodology_drc_routed.rptyD:/Digital Design/Course/session4/Assignment_4/Problem_2/DSP_module/DSP_module.runs/impl_1/DSP_methodology_drc_routed.rpt2default:default8Z2-1520h px� 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px� 
�
%s4*runtcl2�
nExecuting : report_power -file DSP_power_routed.rpt -pb DSP_power_summary_routed.pb -rpx DSP_power_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2u
areport_power -file DSP_power_routed.rpt -pb DSP_power_summary_routed.pb -rpx DSP_power_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
982default:default2
32default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
report_power: 2default:default2
00:00:032default:default2
00:00:052default:default2
1665.6132default:default2
14.9802default:defaultZ17-268h px� 
�
%s4*runtcl2g
SExecuting : report_route_status -file DSP_route_status.rpt -pb DSP_route_status.pb
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_timing_summary -max_paths 10 -file DSP_timing_summary_routed.rpt -pb DSP_timing_summary_routed.pb -rpx DSP_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px� 
�
UpdateTimingParams:%s.
91*timing2R
> Speed grade: -3, Delay Type: min_max, Timing Stage: Requireds2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 
�
rThe design failed to meet the timing requirements. Please see the %s report for details on the timing violations.
188*timing2"
timing summary2default:defaultZ38-282h px� 
�
}There are set_bus_skew constraint(s) in this design. Please run report_bus_skew to ensure that bus skew requirements are met.223*timingZ38-436h px� 
|
%s4*runtcl2`
LExecuting : report_incremental_reuse -file DSP_incremental_reuse_routed.rpt
2default:defaulth px� 
x
TNo incremental reuse to report, no incremental placement and routing data was found.278*	vivadotclZ4-545h px� 
|
%s4*runtcl2`
LExecuting : report_clock_utilization -file DSP_clock_utilization_routed.rpt
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_bus_skew -warn_on_violation -file DSP_bus_skew_routed.rpt -pb DSP_bus_skew_routed.pb -rpx DSP_bus_skew_routed.rpx
2default:defaulth px� 
�
UpdateTimingParams:%s.
91*timing2R
> Speed grade: -3, Delay Type: min_max, Timing Stage: Requireds2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 


End Record