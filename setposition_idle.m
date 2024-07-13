
function setposition_idle(angles)

[servo_joint_angles, ~] = dh2servo(angles);
        
arb = Arbotix('port','COM5','nservos',5);


arb.setpos(2,servo_joint_angles(2),20);
pause(5);
arb.setpos(3,servo_joint_angles(3),20);
pause(8);
arb.setpos(4,servo_joint_angles(4),20);
pause(8);
arb.setpos(1,servo_joint_angles(1),20);
end