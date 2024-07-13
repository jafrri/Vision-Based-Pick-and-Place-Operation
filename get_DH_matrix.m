

% Generic link transform function that generates a homogeneous transform
% matrix from the DH parameters.
function T = get_DH_matrix(a,alpha,d,theta)
T = [cos(theta), -sin(theta)*cos(alpha), sin(theta)*sin(alpha), a*cos(theta);
    sin(theta),cos(theta)*cos(alpha),-cos(theta)*sin(alpha), a*sin(theta);
    0,sin(alpha),cos(alpha),d;
    0,0,0,1];
end