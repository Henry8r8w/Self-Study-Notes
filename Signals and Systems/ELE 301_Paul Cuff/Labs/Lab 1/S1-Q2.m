% x(t) = sin(2t), t \in [0, 10]
% note: the intersample time T/N = Fs = Ts = delta -can deduce-> sample frequency 1/ Fs = N/ T = 1/ delta = 1/ Ts
% sample at k: s(k) = x(t_k) = k*\delta, where k = 0,.., N - 1

Ts=0.1; % the intersample time
N=100;  % N 
w0=2;   %  = 2*pi*f, where f = 1/pi
t=(0:1:N-1)*Ts; % 1XN matrix * T_s; k*delta
x=sin(t*w0);    % signal definition
y=cos(t*w0);

% Overlay plots (use close; before the next plot)
hold on;
plot(t,x,'-',t,y,'--'); % plot(X1,Y1,LineSpec1,...,Xn,Yn,LineSpecn)
grid
xlabel('time - secs')
ylabel('signal x')
title('Plot of x and y vs t')
hold off;

% Subplots (use close; before the next plot)
hold on;
subplot(2,1,1), plot(t,x,'g');
grid
xlabel('time - secs')
ylabel('signal x')
title('Plots of x and y')

subplot(2,1,2), plot(t,y,'r');
grid
xlabel('time - secs')
ylabel('signal y')
hold off;

% Seperate figures
hold on;
figure (1)
plot(t,x);
grid on;
xlabel('time - secs')
ylabel('signal x')
figure(2)
plot(t,y);
grid on;
xlabel('time - secs')
ylabel('signal y')
hold off;

% Listen to the signal
Ts = 0.0001;
delta = 1/Ts;
sound(x, delta)

% Writing an M-file
P = path;
path(P,'C:your\path\to\the\file');

clear; % clear memory
clf reset; % clear all figures
T=10; % signal duration
Fs=8000; % sampling frequency
t=0:1/Fs:T; % time axis
x=exp(-2*t).*sin(2*pi*f*t);
plot(t(1:n),x(1:N),'r')
grid
xlabel('time-secs')
ylabel('signal value - volts')
title('A Plot of a Simple Signal')
sound(x,Fs) % play the signal


