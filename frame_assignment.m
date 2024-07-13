function [K]= frame_assignment(X,Y)
K=[];
[m n]=size(X);
for i=1:m
    output=[];
    rowx=X(i,:);
    rowy = Y(i,:);
    [x_min,jmin]=min(rowx);
    y_min = Y(i,jmin);
    [x_max,jmax]=max(rowx);
    y_max = Y(i,jmax);
    output=[output x_min];
    output=[output y_min];
    %min and max element removal
    % 
    rowx(jmin)=[];
    rowy(jmin)=[];
    [value,index]=max(rowx);
    rowx(index)=[];
    rowy(index)=[];
    % 
    framex=[rowx(1)-x_min rowx(2)-x_min];
    framey=[rowy(1)-y_min rowy(2)-y_min];

    output=[output framex(1)];
    output=[output framey(1)];
    output=[output framex(2)];
    output=[output framey(2)]; 
    K=[K;output];
end


end
