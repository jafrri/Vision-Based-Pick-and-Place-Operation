function sol=findOptimalSolution(input)
    x=input(1);
    y=input(2);
    z=input(3);
    phi=input(4);
    currentConfig=getCurrentPose();
    joint_var=findJointAngles(x,y,z,phi);
    valid_joint_var=checkJointLimits(joint_var);
    deviation=[];
    for i=1:size(valid_joint_var,1)
        deviation_i=abs(currentConfig(1)-valid_joint_var(i,1))+abs(currentConfig(2)-valid_joint_var(i,2))+abs(currentConfig(3)-valid_joint_var(i,3))+abs(currentConfig(4)-valid_joint_var(i,4));
        deviation=[deviation deviation_i]
    end
    index=find(deviation==min(deviation))
    sol=valid_joint_var(index,:);
end