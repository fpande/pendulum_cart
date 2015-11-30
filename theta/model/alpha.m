function out = alpha( theta, param )

l=param(1);
w=param(2);


out = cos(theta)*(-cos(theta)*l*w+1)/w+1;
    
end

