function [attract] = strength(vehicle,target,r,obstacle)

%   Description - This function calculates the strength of the target and returns the new location of the vehicle.
%   vehicle - position of the vehicle.
%   target - position of the target.
%   r - sweep area for sensor.
%   obstacle - position of the obstacle.

P0=5;
E=1.1702;
[xp,yp]=circle(vehicle(1,1),vehicle(1,2),r);
points(1:20,1)=xp;
points(1:20,2)=yp;
for i=1:20
     Uatt(i)=(E/2)*(findSqDistance(points(i,1:2),target))^2;
     d=findSqDistance(points(i,1:2),obstacle);
     if d<=P0
         Urep(i)=(E/2)*((1/d)-(1/P0))^2;
     else
         Urep(i)=0;
     end
 PF(i)=Uatt(i)+Urep(i);
end

S=min(PF);
PF=PF';
points(1:20,3)= PF;

for i=1:20
    if points(i,3)==S
        p=i;
    end
end

attract(1,1)=points(p,1);
attract(1,2)=points(p,2);
attract(1,3)=S;
plot(attract(1,1),attract(1,2),'c*','LineWidth',1.5,'MarkerSize',20);

end