



function coverage = workspc7(cords)
    
    % Symbolic vars
    
    syms theta1 theta2 theta3 theta4
    
    % DH parameters
    test_dh = [0 -pi/2 142.13 theta1; ...
               103.49 0 0 theta2; ...
               103.42 0 0 theta3; ...
               60.67 0 0 theta4];
    
    % Parameter ranges
    theta1_range = (linspace(-150*pi/180,150*pi/180,50));
    theta2_range = (linspace(-150*pi/180,150*pi/180,50));
    theta3_range = (linspace(-150*pi/180,150*pi/180,50));
    theta4_range = (linspace(-150*pi/180,150*pi/180,50));
    
    
    test_map = containers.Map({'theta1', 'theta2', 'theta3','theta4'}, ...
         {theta1_range, theta2_range, theta3_range, theta4_range}) 
    % Workspace plotting function + timing
    position=plot3dworkspace(test_dh, test_map);
    
    x_reach = position{1};
    y_reach = position{2};
    
    xr_min = min(x_reach);
    xr_max = max(x_reach);
    yr_min = min(y_reach);
    yr_max = max(y_reach);


    if cords(1) > xr_min && cords(1) < xr_max
        if cords(2) > yr_min && cords(2) < yr_max
            coverage = true;
        else
            coverage = false;

        end
    else
        coverage = false;
    end

end
