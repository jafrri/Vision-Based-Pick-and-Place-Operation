

function dhJointAngles = servo2dh(jointAngles)
    dhJointAngles = [];

    for i = 1:4
        if i == 2
            dhJointAngles(i) = jointAngles(i) - pi/2;
        else
            dhJointAngles(i) = jointAngles(i);
        end
    end
end
