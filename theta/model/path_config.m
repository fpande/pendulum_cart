clc
clear all
y_c=0;



%[w c]
motion_parameters=[3 0.3];
w=motion_parameters(1);
c=motion_parameters(2);


%creating proposed path 
theta=pi:pi/100:10*pi;
x_c = (-sin(theta)*c*w+theta)/w;

x_p = x_c + sin(theta);
y_p = cos(theta);

figure(1)

plot(x_p,y_p,'r');

%{

for theta_iter=1:20:length(theta);
    x_c = (-sin(theta(theta_iter))*c*w+theta(theta_iter))/w;
    x_p = x_c + sin(theta(theta_iter));
    y_p=cos(theta(theta_iter));
    line([x_p;x_c],[y_p;y_c]);
end

%}

