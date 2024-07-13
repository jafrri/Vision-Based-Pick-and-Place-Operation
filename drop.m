

    % Helper arbitrary function for dropping
function drop()
 arb = Arbotix('port','COM5','nservos',5);

 arb.setpos(5,pi/6,100)

end