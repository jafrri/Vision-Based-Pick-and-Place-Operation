function fsm(pick_coords, place_coords)
    % FSM states
    arb = Arbotix('port', 'COM5', 'nservos', 5);
    IDLE_STATE = 0;
    CHECK_REACHABLE_STATE = 1;
    FIND_JOINT_ANGLES_STATE = 2;
    MOVE_TO_PICK_STATE = 3;
    DESCEND_PICK_STATE = 4;
    MOVE_TO_PLACE_STATE = 5;
    DESCEND_PLACE_STATE = 6;

    % Initial state
    state = IDLE_STATE;

    % Create copies for original and transformed pick and place coordinates
    pickp = phifinder(pick_coords(1),pick_coords(2));
    placep = phifinder(place_coords(1),place_coords(2));
    pick_coords(4) = pickp;
    place_coords(4) = placep;
    original_pick_coords = pick_coords;
    % pick_coords(4)
    transformed_pick_coords = pick_coords;
    original_place_coords = place_coords;
    transformed_place_coords = place_coords;



    while true
        switch state
            case IDLE_STATE
                setposition_idle([0, 0, 0, 0]);
                pause(10)
                state = CHECK_REACHABLE_STATE;

            case CHECK_REACHABLE_STATE
                if ~workspc7(original_place_coords)
                    state = IDLE_STATE;
                else
                    state = FIND_JOINT_ANGLES_STATE;
                end

            case FIND_JOINT_ANGLES_STATE
                original_pick_angles = findOptimalSolution(original_pick_coords);
                original_place_angles = findOptimalSolution(original_place_coords);
                state = MOVE_TO_PICK_STATE;

            case MOVE_TO_PICK_STATE
                transformed_pick_coords(3) = transformed_pick_coords(3) + 100;
                transformed_pick_angles = findOptimalSolution(transformed_pick_coords);
                disp("I am done moving")
                setPosition(transformed_pick_angles);
                pause(5);
                % Error is here, debug
                disp("I have done computing")
                state = DESCEND_PICK_STATE;

            case DESCEND_PICK_STATE
                pause(10)
                setPosition(original_pick_angles);
                pause(10)
                pick();
                state = MOVE_TO_PLACE_STATE;

            case MOVE_TO_PLACE_STATE
                disp("I entered here")
                transformed_place_coords(3) = transformed_place_coords(3) + 100;
                transformed_place_coords(4) = 0;
                transformed_place_angles = findOptimalSolution(transformed_place_coords);
                setPosition(transformed_place_angles);
                pause(5);
                state = DESCEND_PLACE_STATE;

            case DESCEND_PLACE_STATE
                setPosition(original_place_angles);
                pause(5);
                drop();
                setposition_idle([0, 0, 0, 0]);
                state = IDLE_STATE;
                % Break out of loop as job is done
                break;
        end
    end
end
