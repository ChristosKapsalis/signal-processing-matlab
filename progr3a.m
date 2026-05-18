%Ανάλυση σύμφωνα με την προηγούμενη άσκηση:
%x(t)=1/(t^2+1)
%Προσέγγιση 1: Το σήμα x(t)~0 όταν t^2>>1 
%Επομένως, t^2~10^3 και τελικά το σήμα θεωρείται μηδενικό για -100s<=t<=+100s.

%e^(-|t|)  -> 2/(1+Ω^2)
%Από ιδιότητες fourier (συμμετρίας) προκύπτει ότι ο μετασχηματισμός fourier
%του σήματος x(t) -> Χ(Ω)=π*e^(-|Ω|)

%Για την εύρεση του Ω_0 λύνουμε την Χ(Ω_0)=0 από την οποία προκύπτει ότι
%Ω_0=5rad/sec.
%Ω>=Ω_0=5rad/sec
%Για την περίοδο δειγματοληψίας από τον νόμο του Niquist:
%Ts=1/fs=1/2fmax=π/Ω_0=π/5~0,6s
%Δt<<Ts => το Δt μπορεί να πάρει την τιμή 0,1s.

%(a) Fs=100 => Ts=10^(-2)

close all;
clear all;
clc;

Dt=0.1;
t=-100:Dt:100;
x=1./(t.^2+1);

%Deigmatolipsia
Ts=1e-2;
n=-10000:1:10000; %Ypervolika megalo alla einai antistoixo tou programatos 2 afou einai 200/0,01=20000 deigmata
x_d=1./((n*Ts).^2+1);

%Arithmitikos upologisms tou oloklirwmatos
iter_max=500;
iter=0:1:iter_max;
w=(iter/iter_max)*5;
X_d=x_d*exp(-i*n'*w);
X_d=real(X_d);

w=[-fliplr(w),w(2:iter_max+1)];
X_d=[fliplr(X_d),X_d(2:iter_max+1)];

figure(1);
subplot(2,1,1); 
plot(t,x);
xlabel('t[sec]'); 
ylabel('x(t)');
title('Discrete signal (Ts=0.01sec)');
hold on; 
stem(n*Ts,x_d); 
hold off; 
subplot(2,1,2);
plot(w,X_d);
xlabel('f');
ylabel('X_1(i\Omega)');
title('Discrete-time Fourier transform');

print -dpdf progr32; 