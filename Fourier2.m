%%%Askisi4.

clear all;
close all;
clc;

%Ορισμός ω.
omega=[1, 2, 3];
N=500;  %Αρκετά μεγάλο N όπως στην άσκηση 3.

%Υπολογισμός για κάθε ω.
for (k=1:length(omega))
    w=omega(k);

    %Υπολογισμός τοτ αθροίσματος.
    sumX=0;
    for(n=0:N)
        sumX=sumX+(0.5*exp(-1i*w))^n;
    end
    X(k)=sumX;

    %Θεωρητικό:
    X_theor=exp(i*w)./(exp(i*w)-0.5*ones(1,501));
end

    %Εμφάνιση αποτελεσμάτων:
    fprintf('Για ω = %d: \n',w);
    fprintf('Μέσω Αθροίσματος (%d όρων): %.6f + %.6fi\n', N+1, real(sumX), imag(sumX));

%Για τα οπτικοποίηση με plot οπως ασκηση3
w_plot=[0:1:500]*pi/500;
for i = 1:length(w_plot)
    sumX = 0;
    for n = 0:N
        sumX = sumX + (0.5*exp(-1i*w_plot(i)))^n;
    end
    X_plot(i) = sumX;
end

magX=abs(X_plot); 
angX=angle(X_plot);
realX=real(X_plot);
imagX=imag(X_plot);

figure(1);
subplot(2,2,1);
plot(w_plot, magX);
xlabel('\omega');
ylabel('Magnitude');
title('Magnitude Part');
axis([0 pi min(magX) max(magX)]);

subplot(2,2,3);
plot(w_plot, angX);
xlabel('\omega');
ylabel('Phase (rad)');
title('Phase Part');
axis([0 pi min(angX) max(angX)]);

subplot(2,2,2);
plot(w_plot, realX);
xlabel('\omega');
ylabel('Real Part');
title('Real Part');
axis([0 pi min(realX) max(realX)]);

subplot(2,2,4);
plot(w_plot, imagX);
xlabel('\omega');
ylabel('Imaginary Part');
title('Imaginary Part');
axis([0 pi min(imagX) max(imagX)]);

print -dpdf Fourier2.pdf;

%%%Απαντήσεις στις ερωτήσεις του οδηγού:
% 1) το n τρέχει από 0 έως 500 σύνολο 501 φορές.
% 2) μπορούμε να την σταματήσουμε για αρκετά μεγάλο n διότι οι όροι για
%n>500 είναι αριθμητικά αμελητέοι, καθώς κάθε όρος (0.5)^n μειώνεται
%εκθετικά.
% 3) Σε σχέση με τον θεωρητικό τρόπο μπορεί να τροποποιηθεί εύκολα για
% άλλα σήματα, παράλληλα εξετάζεται και η σύγκλιση και φαίνεται και η
% φυσική σημασία του άπειρου αθροίσματος
% 4) ναι αλλάζοντας απλά την παράμετρο από 0.5 σε 0.1
% 5) Οχι διότι δεν ικανοποιείται η συνθήκη σύγκλισης.
% 6) Όχι διότι δεν συγκλίνει. Ωστόσο μπορούμε να χρησιμοποιήσουμε δέλτα
% συναρτήσεις για να υπολογίσουμε την συγκεκριμένη ακολουθία.