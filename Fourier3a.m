clear all;
close all;
clc;
M=500; n1=0; n2=1000;
n0=0;
k=[0:1:M];
[u_step,n]=step_f(n0,n1,n2);
x=(0.5.^n).*u_step;
nT=n.';
arg1=-i*pi/M;
X=x*((exp(arg1)).^(nT*k));
magX=abs(X);
angX=angle(X);
realX=real(X);
imagX=imag(X);
figure(1);
subplot(2,2,1);
plot(k,magX);
xlabel('k');
ylabel('Magnitude');
title('Magnitude Part');
axis([0 M min(magX) max(magX)]);

subplot(2,2,3);
plot(k,angX);
xlabel('k');
ylabel('Radians');
title('Angle Part');
axis([0 M min(angX) max(angX)]);

subplot(2,2,2);
plot(k,realX);
xlabel('k');
ylabel('Real');
title('Real Part');
axis([0 M min(realX) max(realX)]);

subplot(2,2,4);
plot(k,imagX);
xlabel('k');
ylabel('Imaginary');
title('Imaginary Part');
axis([0 M min(imagX) max(imagX)]);

print -dpdfprogr24