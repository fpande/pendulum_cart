function [ out ] = alpha0_v1( x_p,w )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

out = cos(w*x_p)*(cos(w*x_p)*w+1)-cos(w*x_p)*w/sqrt(1-sin(w*x_p)^2);



end
