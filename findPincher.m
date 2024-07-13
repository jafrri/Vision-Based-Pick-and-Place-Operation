
function [x,y,z,R,phi] = findPincher()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
arb = Arbotix('port', 'COM5', 'nservos', 5)

for i = 1:4
    jointAngles(i) = arb.getpos(i);
end

dhJointAngles = servo2dh(jointAngles)

[x,y,z,R] = pincherFK(dhJointAngles(1), dhJointAngles(2), dhJointAngles(3), dhJointAngles(4));
phi=dhJointAngles(2)+dhJointAngles(3)+dhJointAngles(4);

end