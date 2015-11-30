
clc
clear all
close all
l=-1.2;
w=pi/5;

param=[l w];

theta=pi:-0.001:-6*pi;

for sample=1:length(theta)
    ut(sample)=alpha(theta(sample),param);
end

plot(theta,ut)