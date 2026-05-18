close all;
clc;
clear all;

t=-20:0.001:20;
ft=sin(t/2);

n=-20:1:20;
fn=sin(n/2);

figure(1);
subplot(2,1,1);
plot(t,ft);
subplot(2,1,2);
stem(n,fn);

print-dpdfpr11;
