

close all
clc
% 
jointangles1=[sol1(1) sol1(2) sol1(3) theta4_sol1(1) theta5_sol1(1) theta6_sol1(1)]
jointangles2=[sol1(1) sol1(2) sol1(3) theta4_sol1(1) theta5_sol1(1) theta6_sol1(1)]

jointangles3=[sol2(1) sol2(2) sol2(3) theta4_sol2(1) theta5_sol2(1) theta6_sol2(1)]
jointangles4=[sol2(1) sol2(2) sol2(3) theta4_sol2(2) theta5_sol2(2) theta6_sol2(2)]

jointangles5=[sol3(1) sol3(2) sol3(3) theta4_sol3(1) theta5_sol3(1) theta6_sol3(1)]
jointangles6=[sol3(1) sol3(2) sol3(3) theta4_sol3(2) theta5_sol3(2) theta6_sol3(2)]

jointangles7=[sol4(1) sol4(2) sol4(3) theta4_sol4(1) theta5_sol4(1) theta6_sol4(1)]
jointangles8=[sol4(1) sol4(2) sol4(3) theta4_sol4(2) theta5_sol4(2) theta6_sol4(2)]


T_06_validation1=double(subs(T_06,[theta_1 theta_2 theta_3 theta_4 theta_5 theta_6],[sol1(1) sol1(2) sol1(3) theta4_sol1(1) theta5_sol1(1) theta6_sol1(1)]))
T_06_validation2=double(subs(T_06,[theta_1 theta_2 theta_3 theta_4 theta_5 theta_6],[sol1(1) sol1(2) sol1(3) theta4_sol1(2) theta5_sol1(2) theta6_sol1(2)]))

T_06_validation3=double(subs(T_06,[theta_1 theta_2 theta_3 theta_4 theta_5 theta_6],[sol2(1) sol2(2) sol2(3) theta4_sol2(1) theta5_sol2(1) theta6_sol2(1)]))
T_06_validation4=double(subs(T_06,[theta_1 theta_2 theta_3 theta_4 theta_5 theta_6],[sol2(1) sol2(2) sol2(3) theta4_sol2(2) theta5_sol2(2) theta6_sol2(2)]))

T_06_validation5=double(subs(T_06,[theta_1 theta_2 theta_3 theta_4 theta_5 theta_6],[sol3(1) sol3(2) sol3(3) theta4_sol3(1) theta5_sol3(1) theta6_sol3(1)]))
T_06_validation6=double(subs(T_06,[theta_1 theta_2 theta_3 theta_4 theta_5 theta_6],[sol3(1) sol3(2) sol3(3) theta4_sol3(2) theta5_sol3(2) theta6_sol3(2)]))

T_06_validation7=double(subs(T_06,[theta_1 theta_2 theta_3 theta_4 theta_5 theta_6],[sol4(1) sol4(2) sol4(3) theta4_sol4(1) theta5_sol4(1) theta6_sol4(1)]))
T_06_validation8=double(subs(T_06,[theta_1 theta_2 theta_3 theta_4 theta_5 theta_6],[sol4(1) sol4(2) sol4(3) theta4_sol4(2) theta5_sol4(2) theta6_sol4(2)]))

figure;
Visualizer_Q2(jointangles1);hold on
Visualizer_Q2(jointangles2)
Visualizer_Q2(jointangles3)
Visualizer_Q2(jointangles4)
Visualizer_Q2(jointangles5)
Visualizer_Q2(jointangles6)
Visualizer_Q2(jointangles7)
Visualizer_Q2(jointangles8)