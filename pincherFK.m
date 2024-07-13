

function [x,y,z,R,T_04] =  pincherFK(theta_1,theta_2,theta_3,theta_4)

L1 = 0;
L2 = 103.49;
L3 = 103.42;
L4 = 69.67;
d1 = 142.13;

% DH parameters
cos_90=round(cos(-pi/2),1);

% Transformation matrices
T_01 = [cos(theta_1), -sin(theta_1)*-cos_90, sin(theta_1)*sin(-pi/2), 0;
        sin(theta_1), cos(theta_1)*-cos_90, -cos(theta_1)*sin(-pi/2), 0;
        0, sin(-pi/2), cos_90, d1;
        0, 0, 0, 1];


T_12 = [cos(theta_2), -sin(theta_2)*cos(0), sin(theta_2)*sin(0), L2*cos(theta_2);
        sin(theta_2), cos(theta_2)*cos(0), -cos(theta_2)*sin(0), L2*sin(theta_2);
        0, sin(0), cos(0), 0;
        0, 0, 0, 1];


T_23 = [cos(theta_3), -sin(theta_3)*cos(0), sin(theta_3)*sin(0), L3*cos(theta_3);
        sin(theta_3), cos(theta_3)*cos(0), -cos(theta_3)*sin(0), L3*sin(theta_3);
        0, sin(0), cos(0), 0;
        0, 0, 0, 1];


T_34 = [cos(theta_4), -sin(theta_4)*cos(0), sin(theta_4)*sin(0), L4*cos(theta_4);
        sin(theta_4), cos(theta_4)*cos(0), -cos(theta_4)*sin(0), L4*sin(theta_4);
        0, sin(0), cos(0), 0;
        0, 0, 0, 1];

T_04 = (T_01 *  T_12  * T_23 * T_34);

R=T_04(1:3,1:3);
Trans_final=T_04(1:3,4);
T = transpose(Trans_final);
x = T(1);
y = T(2);
z = T(3);


end