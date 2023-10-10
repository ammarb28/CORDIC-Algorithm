clear all;
clc;
close all;

bitWidth = 16;

%0.1001101101110101
k_circular = 0.60725293500888;

%set x0 = k, y0 = 0, z0 = input
%max z0 = 1.7432866 radians (99.9deg)
%yvector --> sin(z0)
%xvector --> cos(z0)
x0 = k_circular;
y0 = 0;
z0 = 0.5;

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
    
    xvector(i+1) = xvector(i) - (sigmavector(i)*yvector(i)*(2^(-i+1)));
    yvector(i+1) = yvector(i) + (sigmavector(i)*xvector(i)*(2^(-i+1)));
    zvector(i+1) = zvector(i) - (sigmavector(i)*(atan(2^(-i+1))));
    sigmavector(i+1) = sign(zvector(i+1));
end