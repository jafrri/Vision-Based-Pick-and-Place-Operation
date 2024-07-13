



function pickandplace(pick_c,place_c)

current_state = 0


function pick_and_place_cube(pick_coords,place_coords)
current_state = 0; % ideal state
% Including Offests in z axis of the end effector
pick_coords(3) = pick_coords(3) + 2;

place_coords(3) = place_coords(3) + 2;
height_of_block = 2.8; % cm
n=1; % to make sure this only works once
while n==1
% pick phenomenon
current_state % Placed this to see where our code is currently at
if current_state == 0
arb = Arbotix('port', 'COM5', 'nservos', 5);
arb.setpos([0,0,-pi/4,-pi/2,0],[25,25,25,25,25]);% to put or arm in default position
pause(5);
error_ = find_error([0,0,0,0,0],[arb.getpos]);% checking error margin if its less then
if error_ == false
current_state = 1;
else
current_state = 0;
end
% moving to new current state
current_state
elseif current_state == 1

    pick_coords(3) = pick_coords(3) + 2*height_of_block;% offests so the the wrist hover o
coords_1 = findOptimalsoln(pick_coords(1),pick_coords(2),pick_coords(3),pick_coords(4),
current_state = 2;
current_state
elseif current_state == 2
% Moving towards pick position
setPosition(coords_1,0);
pause(5);
arb = Arbotix('port', 'COM17', 'nservos', 5);
curr_pos = arb.getpos;% again checking the error margin
error_1 = find_error([coords_1,0],[curr_pos]);
if error_1 == false
current_state = 3;
else
current_state = 2;
end
current_state
elseif current_state == 3
pick_coords(3) = pick_coords(3) - 4*height_of_block; % so that the arm could move down
coords_2 = findOptimalsoln(pick_coords(1),pick_coords(2),pick_coords(3),pick_coords(4),
setPosition(coords_2,0);


