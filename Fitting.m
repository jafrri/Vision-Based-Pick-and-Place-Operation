

x = [27.1, 18, 20.6, 12.1]; % Add commas to separate elements
y=[0 0 0 0];

r= sqrt((x*100).^2 + (y*100).^2);

phi = [1.973, 3.03, 2.71, 3.129]; % Add commas to separate elements

p = polyfit(r, phi, 2);

x1 = linspace(0, 400);
y1 = polyval(p, x1);

figure
plot(x, phi, 'o') % Plot x against phi
hold on
plot(x1, y1)
hold off
