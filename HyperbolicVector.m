clear all;
clc;
close all;

bitWidth = 32;

k_hyperbolic = 0.82816;

%set x0 = 1/k, y0 = 0, z0 = input to get tanh(z0) and 
%set x0 = input+1, y0 = input-1, z0 = 0, to get zvector = 0.5*ln(input)
%max input = 1.1181730 radians (64deg)
x0 = 1+0.5;
y0 = 0.5-1;
z0 = 0;

xvector = zeros(1,bitWidth);
yvector = zeros(1,bitWidth);
zvector = zeros(1,bitWidth);
sigmavector = zeros(1,bitWidth);

for i = 1:bitWidth
    if i == 1
        xvector(i) = x0;
        yvector(i) = y0;
        zvector(i) = z0;
        sigmavector(i) = -sign(yvector(i)*xvector(i));
    end
    
    xvector(i+1) = xvector(i) + (sigmavector(i)*yvector(i)*(2^(-i)));
    yvector(i+1) = yvector(i) + (sigmavector(i)*xvector(i)*(2^(-i)));
    zvector(i+1) = zvector(i) - (sigmavector(i)*(atanh(2^(-i))));
    sigmavector(i+1) = -sign(yvector(i+1)*xvector(i+1));
    
end

