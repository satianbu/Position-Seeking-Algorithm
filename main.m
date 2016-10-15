clc;
clear all;
%target= input('Input target co-ordinates,[x y]\n');
target = [0 0];
vehicle1 = input('Input 1st Vechicle co-ordinates,[x y]\n');
vehicle2 = input('Input 2nd Vechicle co-ordinates,[x y]\n');
obstacle = input('Input obstacle co-ordinates,[x y]\n');
r=1; %the sweep area for sensor

plot(target(1),target(2),'rx','LineWidth',5,'MarkerSize',30);
target_txt = '\leftarrow Target';
text(target(1),target(2),target_txt);
hold on

plot(vehicle1(1,1),vehicle1(1,2),'g*','LineWidth',3,'MarkerSize',20);
vehicle1_txt = '\leftarrow Vehicle 1';
text(vehicle1(1,1),vehicle1(1,2),vehicle1_txt);
hold on

plot(vehicle2(1,1),vehicle2(1,2),'g*','LineWidth',3,'MarkerSize',20);
vehicle2_txt = '\rightarrow Vehicle 2';
text(vehicle2(1,1),vehicle2(1,2),vehicle2_txt);
hold on

plot(obstacle(1,1),obstacle(1,2),'m*','LineWidth',5,'MarkerSize',20);
obstacle_txt = '\rightarrow Obstacle';
text(obstacle(1,1),obstacle(1,2),obstacle_txt);
hold on

vehicle1_newloc(1,1:3)=strength(vehicle1,target,r,obstacle);
z1=vehicle1_newloc(1,3);
vehicle2_newloc(1,1:3)=strength(vehicle2,target,r,obstacle);
z2=vehicle2_newloc(1,3);

if abs(vehicle1(1,1)) > abs(vehicle2(1,1))
    xmax=abs(vehicle1(1,1));
else
    xmax=abs(vehicle2(1,1));
end

if abs(vehicle1(1,2)) > abs(vehicle2(1,2))
    ymax=abs(vehicle1(1,2));
else
    ymax=abs(vehicle2(1,2));
end

[Xgrid,Ygrid] = meshgrid(-xmax:1:xmax,-ymax:1:ymax);
z = Xgrid .* exp(-Xgrid.^2 - Ygrid.^2);
[px,py] = gradient(z,2,15);
quiver(Xgrid,Ygrid,Xgrid+px,Ygrid+py);
hold on
       
while(z1>1 || z2>1)
    
    vehicle1_newloc(2,1:3)=strength(vehicle1_newloc(1,1:3),target,r,obstacle);
    vehicle1_newloc(1,1:3)=vehicle1_newloc(2,1:3);
    z1=vehicle1_newloc(1,3);
    
    vehicle2_newloc(2,1:3)=strength(vehicle2_newloc(1,1:3),target,r,obstacle);
    vehicle2_newloc(1,1:3)=vehicle2_newloc(2,1:3);
    z2=vehicle2_newloc(1,3);
   
end