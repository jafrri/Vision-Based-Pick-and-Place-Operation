function [servoJointAngles, errorCode] = dh2servo(jointAngles)
    % DH2SERVO Converts DH joint angles to servo motor angles for Phantom X Pincher
    % [servoJointAngles, errorCode] = dh2servo(jointAngles)
    % Inputs:
    %   jointAngles: Vector of joint angles in radians or degrees, from base to wrist
    % Outputs:
    %   servoJointAngles: Corresponding servo motor angles in radians
    %   errorCode: Error code indicating success (0) or failure (1)

    % Define angle limits for the motors
    servoAngleLimits = [-150*pi/180, 150*pi/180];

    % Initialize outputs
    servoJointAngles = [];
    errorCode = 0; % Default to success

    % Iterate through each joint angle and convert to servo motor angle
    for i = 1:length(jointAngles)
        % Convert DH angle to servo angle based on DH frame assignment
        if i == 2
            servoAngle = jointAngles(i) + pi/2; % Adjust for DH frame assignment
        else
            servoAngle = jointAngles(i);
        end
        
        % Map servo angle to range [-pi, pi]
        mappedAngle = mod(servoAngle + pi, 2*pi) - pi;

        % Check if the mapped angle is within servo angle limits
        if mappedAngle < servoAngleLimits(1) || mappedAngle > servoAngleLimits(2)
            % If angle is outside limits, set error code and return empty servoJointAngles
            errorCode = 1;
            servoJointAngles = [];
            return;
        else
            % Add mapped angle to servoJointAngles
            servoJointAngles(i) = mappedAngle;
        end
    end
end
