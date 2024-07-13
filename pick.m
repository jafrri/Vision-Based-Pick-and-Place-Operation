% Helper arbitrary function for picking
function pick()

arb = Arbotix('port','COM5','nservos',5);
arb.setpos(5,pi/8,100)
arb.setpos(5,pi/3,100);
       
end