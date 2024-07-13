function errorCode=setPosition(jointAngles)
    arb = Arbotix('port', 'COM5', 'nservos', 5);
    
    servo_angles=dh2servo(jointAngles)
    servo_jointangle_check=mod(servo_angles+pi,2*pi)-pi;
    servo_jointangle_check=abs(servo_jointangle_check/(5*pi/6));

    if(max(servo_jointangle_check)>1)
        errorCode=1
    else
        errorCode=0
        for i = 1:4
            arb.setpos(i,servo_angles(i),40)
        end
    end
end