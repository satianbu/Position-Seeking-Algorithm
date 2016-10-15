function[X,Y]=circle(x,y,r)

%   Description - This fuction is used to plot the circle.
%   x and y are the coordinates of the center of the circle.
%   r is the radius of the circle.

theta=linspace(0,2*pi,20); 
xp=r*cos(theta);
yp=r*sin(theta);
X=x+xp;
Y=y+yp;
plot(X,Y,'--k*','MarkerSize',5);
grid on
hold on

end