clear all;
clc;
close all;

bitWidth = 32;

k_circular = 1.64676025812107;

%x0 = input usally =1 , y0 = input, z0 = 0
%max y0 = 1.7432866 radians (99.9deg)
%zvector = sin(y0)
x0 = 1;
y0 = 0.5;
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
    
    xvector(i+1) = xvector(i) - (sigmavector(i)*yvector(i)*(2^(-i+1)));
    yvector(i+1) = yvector(i) + (sigmavector(i)*xvector(i)*(2^(-i+1)));
    zvector(i+1) = zvector(i) - (sigmavector(i)*(atan(2^(-i+1))));
    sigmavector(i+1) = -sign(yvector(i+1)*xvector(i+1));
end