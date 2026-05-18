clear all;
clc;
close all;

x=[1,-2,3,-7,-9,3,5,7,-9,-6,5,7,23,12,-4,-5];
nx=[-6:1:9];

[y1,ny1]=shift_f(x,nx,2); 
[y2,ny2]=shift_f(x,nx,4); 
[y3,ny3]=shift_f(x,nx,-2); 

[y_temp, ny_temp]=add_f(y1,ny1,y2,ny2);
[y,ny]=add_f(y_temp,ny_temp,-y3,ny3); %-y3 dioti theloume -x(n+2)

%gia cor1
[x1,nx1]=rev_f(x,nx);
[rxy,nrxy]=conv_f(y,ny,x1,nx1);

figure(1);

subplot(221);
stem(nx,x);
title('x(n)');
xlabel('n');
ylabel('x(n)');

subplot(222);
stem(ny2,y2);
title('y(n)=x(n-2)+x(n-4)-x(n+2)');
xlabel('n');
ylabel('y(n)');

subplot(212);
stem(nrxy,rxy);
title('r_{x,y}');
xlabel('n');
ylabel('r_{x,y}(n)');

print -dpdf progr19;