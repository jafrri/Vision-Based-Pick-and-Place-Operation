function [X,Y]=point_remover(points)
x=[];
y=[];
X=[];
Y=[];
for i=1:length(points)
    [x]=[x ;points(i).Extrema(:,1)];
    [y]=[y ;points(i).Extrema(:,2)];
end
for j=1:2:8*length(points)
    x_avg=(x(j)+x(j+1))/2;
    y_avg=(y(j)+y(j+1))/2;
    X=[X x(j)];
    Y=[Y y(j)];
end
% x
% y
end