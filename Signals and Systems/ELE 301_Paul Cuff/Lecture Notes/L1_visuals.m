% Even and Odd Symmetry

% Combination Operation: Time Reversal, Shiting, and scaling

% Amplitude Sacling; Discrete Time Scling; Contnious Time Scaling




% Frequency Domain Represented Signal using Sinusoids
t = linspace(0, 1, 1000);
scale = [0.1, 0.7, 0.2];
f = [5, 15, 25]; 
omega = 2 * pi * f; 

% The sinusoid signals
x_1 = scale(1) * sin(omega(1) * t);
x_2 = scale(2) * sin(omega(2) * t);
x_3 = scale(3) * sin(omega(3) * t);

% The composite signal
f_t = x_1 + x_2 + x_3;

figure;
subplot(4, 1, 1);
plot(t, x_1, 'LineWidth', 2);
title('x_1 = 0.1sin(\omega_1 t)');
xlabel('Time, t');
ylabel('Amplitude');
grid on;

subplot(4, 1, 2);
plot(t, x_2, 'LineWidth', 2);
title('x_2 = 0.7sin(\omega_2 t)');
xlabel('Time, t');
ylabel('Amplitude');
grid on;

subplot(4, 1, 3);
plot(t, x_3, 'LineWidth', 2);
title('x_3 = 0.2sin(\omega_3 t)$');
xlabel('Time, t');
ylabel('Amplitude');
grid on;

% Plot composite signal 
subplot(4, 1, 4);
plot(t, f_t, 'LineWidth', 2);
title('f(t) = 0.1 sin(\omega_1 t) + 0.7sin(\omega_2 t) + 0.2sin(\omega_3 t)');
xlabel('Time, t');
ylabel('Amplitude');
grid on;

