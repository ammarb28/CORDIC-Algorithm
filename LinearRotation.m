clear all;
clc;
close all;

bitWidth = 32;

x0 = 50;
y0 = 0;
z0 = 0.7;

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
    
    xvector(i+1) = xvector(i);
    yvector(i+1) = yvector(i) + (sigmavector(i)*xvector(i)*(2^(-i+1)));
    zvector(i+1) = zvector(i) - (sigmavector(i)*(2^(-i+1)));
    sigmavector(i+1) = sign(zvector(i+1));
    
end

