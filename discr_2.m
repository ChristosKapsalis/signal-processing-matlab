close all;
clc;
clear all;

n=[-20:1:20];

fn=3*exp((-0.2+0.5*i).*n);
%%fn=3*exp((-0.2+0.5*i).*n);

fn_r=real(fn);
fn_i=imag(fn);

fn_m=abs(fn);
fn_p=angle(fn);

figure(1);
subplot(2,2,1);
stem(n,fn_r);
title('Real part');
ylabel('fn_r');
xlabel('n');

subplot(2,2,2);
stem(n,fn_i);
title('Imaginary part');
ylabel('fn_i');
xlabel('n');

subplot(2,2,3);
stem(n,fn_m);
title('Magnitude part');
ylabel('fn_m');
xlabel('n');

subplot(2,2,4);
stem(n,fn_p);
title('Phase part');
ylabel('fn_p');
xlabel('n');

print -dpdf pr11b;