clc
clear all
y_c=0;


a=1;
w=pi/5;

%creating proposed path 
x=-10:5/100:10;
y=a*cos(w*x);

figure(1)

subplot(2,1,1)
plot(x,y,'r');
axis([-10 10 -2 2])
title('version1')
line([-20;20],[0;0]);


for x_p = -10:0.5:10
    x_c=x_p + sin((pi/5)*x_p);
    y_p=cos((pi/5)*x_p);
    line([x_p;x_c],[y_p;y_c]);
end

subplot(2,1,2)
plot(x,y,'r');
axis([-10 10 -2 2])
title('version2')
line([-20;20],[0;0]);


for x_p = -10:0.5:10
    x_c=x_p - sin((pi/5)*x_p);
    y_p=cos((pi/5)*x_p);
    line([x_p;x_c],[y_p;y_c]);
end


