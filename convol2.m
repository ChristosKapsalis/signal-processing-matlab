%%Η θεωρητική ανάλυση για την έξοδο μας δίνει ότι yn=x(n-5)*h(5) όπως και
%%προκύπτει στα γραφήματα.

clear all;
close all;
clc;

%Ορισμός για την step_f
n1=-10; %Arxi xron. perioxis
n2=40; %Telos xron. perioxis

%Δημιουργία σήματος εισόδου x(n).
[u1, n]=step_f(0, n1, n2);
[u2, n]=step_f(31, n1, n2);

xn=u1-u2;       %σήμα εισόδου

%Δημιουργία κρουστικής απόκρισης.
[delta1, n1]=step_f(5,n1,n2);
[delta2, n2]=step_f(6,n1,n2);

hn=(0.9^5)*(delta1-delta2);

%Συνέλιξη.
yn=conv(xn,hn);
%Orizoume thn perioxh gia tin eksodo:
n1_new=n(1)+n(1);
n2_new=n(length(u1))+n(length(u2));
n_new=[n1_new:1:n2_new];

subplot(311);
stem(n,xn);
title('Input');
ylabel('x(n)');
xlabel('n');

subplot(312);
stem(n,hn);
title('Impulse Responce');
ylabel('h(n)');
xlabel('n');

subplot(313);
stem(n_new,yn);
title('Output sequence');
ylabel('y(n)');
xlabel('n');

print -dpdfprogr15