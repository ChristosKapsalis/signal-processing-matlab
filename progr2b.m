%οι απαντήσεις στις ερωτήσεις που είναι όμοιες στα δύο προγράμματα έχουν
%απαντηθεί μόνο στο πρόγραμμα 2α.
close all; % Κλείνει όλα τα γραφικά παράθυρα
clear all; % Διαγράφει όλες τις μεταβλητές από το workspace
clc; % Καθαρίζει το παράθυρο εντολών


Dt=5e-5; % Βήμα χρόνου για αναλογικό σήμα Δt=50 μsec
t=-5e-3:Dt:5e-3; % Άξονας χρόνου -5msec<=t<=5msec
x=exp(-1000*abs(t)); % Αναλογικό σήμα x(t) σύμφωνα με την εκφώνηση

Ts=1e-3; %Περίοδος δειγματοληψίας0,001s
n=-5:1:5; % Δείκτες δειγματοληψίας 11
x_d=exp(-1000*abs(n*Ts)); %Σήμα από δειγματοληψία χ(nTs)

%όμοια με 2a
iter_max=500;
iter=0:1:iter_max;
w=(iter/iter_max)*pi;
X_d=x_d*exp(-i*n'*w);
X_d=real(X_d);
w=[-fliplr(w),w(2:iter_max+1)];
X_d=[fliplr(X_d),X_d(2:iter_max+1)];

%όμοια με 2α
figure(1);

subplot(2,1,1);
plot(1000*t,x);
xlabel('t[msec]');
ylabel('x(t)');
title('Discrete signal (Ts=1msec)');
hold on;
stem(n*Ts*1000,x_d);
hold off;

subplot(2,1,2);
plot(w/pi,X_d);
xlabel('f[\pi units]');
ylabel('X_2(i\Omega)');
title('Discrete-time Fourier transform');

print -dpdf progr33; 