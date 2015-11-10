function [ out ] = alpha( theta, a, w )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

out=((cos(theta)*sin(theta/a))/(a*w*sqrt(sin(theta/a)^2))) - sin(theta)*cos(theta) + 1;

end

