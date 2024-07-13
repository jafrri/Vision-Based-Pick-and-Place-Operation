
syms theta_1 d2 theta_3

cos_90=round(cos(pi/2),1);
cos_n90=round(cos(-pi/2),1);

a1=1;
a2=0;
a3=1;

T_01 = [cos(theta_1), -sin(theta_1)*cos_90, sin(theta_1)*sin(pi/2), a1*cos(theta_1);
        sin(theta_1), cos(theta_1)*cos_90, -cos(theta_1)*sin(pi/2), a1*sin(theta_3);
        0, sin(pi/2), cos_90, 0;
        0, 0, 0, 1];

T_12 = [cos(0), -sin(0)*cos_n90, sin(0)*sin(-pi/2), a2*cos(0);
        sin(0), cos(0)*cos_n90, -cos(0)*sin(-pi/2), a2*sin(theta_3);
        0, sin(-pi/2), cos_n90, -d2;
        0, 0, 0, 1];


T_23 = [cos(theta_3), -sin(theta_3)*cos(0), sin(theta_3)*sin(0), a3*cos(theta_3);
        sin(theta_3), cos(theta_3)*cos(0), -cos(theta_3)*sin(0), a3*sin(theta_3);
        0, sin(0), cos(0), 0;
        0, 0, 0, 1];

T_03 = simplify(T_01*T_12*T_23)


wT0b = [0.5 -0.866 0 1;
    0.866 0.5 0 3;
    0 0 1 0;
    0 0 0 1];

wT0a = [0 1 0 1;
    -1 0 0 0.5;
    0 0 1 0;
    0 0 0 1];

R = wT0b(1:3,1:3);
R_o_w = transpose(op);

op = R_o_w * [1;0.5;0]


