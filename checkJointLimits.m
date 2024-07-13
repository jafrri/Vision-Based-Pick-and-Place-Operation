function valid_joints=checkJointLimits(all_sols)
valid_joints=[];
    for m=1:4
        joint_angle=all_sols(m,:);
        servo_jointangles=dh2servo(joint_angle);
        servo_jointangle_check=mod(servo_jointangles+pi,2*pi)-pi;
        servo_jointangle_check=abs(servo_jointangle_check/(5*pi/6));
        if(max(servo_jointangle_check)<1)
            valid_joints=[valid_joints;joint_angle];
        end
    end
end