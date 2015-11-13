function [ out ] = aplha( x_p, a,b,p,w )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%v1
out = (1+(a*cos(w*x_p+p)+b)*a*sin(w*x_p+p)*w/sqrt(1-(a*cos(w*x_p+p)+b)^2))*(a*cos(w*x_p+p)+b)-(a*cos(w*x_p+p)+b)*a*sin(w*x_p+p)*w/(sqrt(1-(a*cos(w*x_p+p)+b)^2)*sqrt((a*cos(w*x_p+p)+b)^2));



end

