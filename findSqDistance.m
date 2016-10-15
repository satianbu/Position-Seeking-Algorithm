function distance = findSqDistance(pt1,pt2)

%   Description - This function is used to calculate the distance between two points.It returns the distance.
%   pt1 and pt2 are the coordinates. 

distance = sqrt((pt1(1)-pt2(1))^2+(pt1(2)-pt2(2))^2);

end