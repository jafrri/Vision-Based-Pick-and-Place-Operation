
function positions=plot3dworkspace(dh_parameters, parameter_ranges, dh_transform_fn)
%PLOT3DWORKSPACE Plots a 3D representation of the reachable workspace of a robot.
%
% Syntax:
%   plot3dworkspace(dh_parameters, parameter_ranges, dh_transform_fn, verbose)
%
% Inputs:
%   dh_parameters: A matrix containing the Denavit-Hartenberg parameters.
%                  Each row represents one link, and the columns are 
%                  [a,alpha,d,theta] for each link.
%
%   parameter_ranges: A containers.Map object where the keys are the names 
%                     of the parameters (as strings), and the values are arrays 
%                     of the values that each parameter can take.
%
%   dh_transform_fn: (Optional) Function handle to a function that computes the 
%                    Denavit-Hartenberg transformation matrix. This 
%                    function should accept four arguments corresponding 
%                    to the four Denavit-Hartenberg parameters (a,alpha,d,theta).
%                    Default: @get_DH_matrix.
%
%   verbose: (Optional) A boolean flag that, when true, triggers the function to 
%            display various calculation details like the transformation matrix 
%            and more. Default: false.
%
% Outputs:
%   No outputs. The function directly plots the reachable workspace.
%

    arguments
        dh_parameters
        parameter_ranges
        dh_transform_fn = @get_DH_matrix
    end

    validate_inputs(dh_parameters, parameter_ranges);
    [x,y,z] = get_xyz_expressions(dh_parameters, dh_transform_fn);
    

    % Get parameter grid

    keys = parameter_ranges.keys;
    param_values = parameter_ranges.values(keys);
    [param_grid{1:numel(param_values)}] = ndgrid(param_values{:});

    % Reshape into value arrays in map
    param_value_map = containers.Map;
    for i = 1:numel(param_grid)
        param_value_map(keys{i}) = reshape(param_grid{i}, 1, []);
        param_grid{i} = 0;
    end

    % Calculate x,y,z positions
    positions = cell(3,1);
    expressions = {x,y,z};
    for i = 1:3
        % Get variables from expression
        expr = expressions{i};
        sym_cell = symvar(expr);
        keys_cell = arrayfun(@char, sym_cell, 'UniformOutput', false);
        % Convert from symbolic to numerical functions for faster evaluation
        pos_func = matlabFunction(expr, 'Vars', sym_cell);
        func_params = values(param_value_map, keys_cell);
        positions{i} = pos_func(func_params{:});
    end
    
    % % Plot points
    % figure;
    % plot3(positions{:},'.');
    % title('Reachable Workspace')
    % xlabel('X-axis') 
    % ylabel('Y-axis')
    % zlabel('Z-axis')
    % axis equal
    % grid on
    % figure;
    % plot(positions{1},positions{2})
    % title('Reachable Workspace')
    % xlabel('X-axis') 
    % ylabel('Y-axis')
    % figure;
    % plot(positions{1},positions{3})
    % title('Reachable Workspace')
    % xlabel('X-axis') 
    % ylabel('Z-axis')
end