function [joint_variables] = findJointAngles(x,y,z, phi)


theta1 = atan2(y, x);
a2 = 103.49;
a3 = 103.42;
d1= 142.13;
a4=69.67;
r = sqrt(x^2+y^2)
s=z-d1
position=[r-a4*cos(phi),s+a4*sin(phi)];
r3=position(1)
s3=position(2)


% For theta1
theta1=[atan2(y,x),pi+atan2(y,x)]

% For theta3
cos_theta3=(r3^2+s3^2-a2^2-a3^2)/(2*a2*a3)
theta3=[atan2(sqrt(1-cos_theta3^2),cos_theta3),atan2(-sqrt(1-cos_theta3^2),cos_theta3)]

% For theta2
cos_alpha=(a2^2+r3^2+s3^2-a3^2)/(2*a2*sqrt(r3^2+s3^2));
alpha=atan2(sqrt(1-cos_alpha^2),cos_alpha)
theta2 = [-(atan2(s3,r3)+alpha),-(atan2(s3,r3)-alpha)];
phi_prime=(pi-phi);
% For theta4
theta4=[phi-theta2(1)-theta3(1),phi-theta2(2)-theta3(2),phi_prime-(pi-theta2(1))+theta3(1),phi_prime-(pi-theta2(2))+theta3(2)];
% All solutions
sol1=[theta1(1),theta2(1),theta3(1),theta4(1)];
sol2=[theta1(1),theta2(2),theta3(2),theta4(2)];
sol3=[theta1(2),pi-theta2(1),-theta3(1),theta4(3)];
sol4=[theta1(2),pi-theta2(2),-theta3(2),theta4(4)];

joint_variables = [sol1;sol2;sol3;sol4];
end