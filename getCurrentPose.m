function currentpose=getCurrentPose()
    arb = Arbotix('port', 'COM5', 'nservos', 5);
    currentpose=[];
for i = 1:4
    currentpose = [currentpose arb.getpos(i)];
end
    % currentpose=jointAngles;
end