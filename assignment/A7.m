% u = -.25:.01:3.25;


u = -6:0.01:6;
x = -5:1:5;5;
y = [5 5 5 5 5 5 5 5 5 5 42];
% plot(x,y,'o',u, polyinter(x, y, u),'-')

plot(x,y,'o',u, newtoninterp(x, y, u),'-')
