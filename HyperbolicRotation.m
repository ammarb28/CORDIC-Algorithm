clear all;
clc;
close all;

bitWidth = 32;

k_hyperbolic = 0.82816;

%set x0 = 1/k, y0 = 0, z0 = input to get sinh(z0) and cosh(z0)
%set x0 = 1/k, y0 = 1/k, z0 = input to get e^z0
%max z0 = 1.1181730 radians (64deg)
x0 = 1/k_hyperbolic;
y0 = 1/k_hyperbolic;
z0 = -1.6;

xvector = zeros(1,bitWidth);
yvector = zeros(1,bitWidth);
zvector = zeros(1,bitWidth);
sigmavector = zeros(1,bitWidth);

for i = 1:bitWidth
    if i == 1 
        xvector(i) = x0;
        yvector(i) = y0;
        zvector(i) = z0;
        sigmavector(i) = sign(zvector(i));
    end
    
    %2^-1 term does not contain plus one since hyperbolic iteration must
    %start from 1
    xvector(i+1) = xvector(i) + (sigmavector(i)*yvector(i)*(2^(-i)));
    yvector(i+1) = yvector(i) + (sigmavector(i)*xvector(i)*(2^(-i)));
    zvector(i+1) = zvector(i) - (sigmavector(i)*(atanh(2^(-i))));
    sigmavector(i+1) = sign(zvector(i+1));
 
end

disp(xvector(30)+yvector(30))