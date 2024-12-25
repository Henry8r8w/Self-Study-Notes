
% Task 4: Phase Error - randph.m
% Two signals played: 
    % 1. 10 frequency from middle C with ten harmonics 
    % 2. same with # bt with a random (by rand) phase in [-pi, pi]
% Ans: It's hard for human to distinguish the difference in the error in the phase.
% I could only tell the difference when the signal is plotted


% Task 3: Harmonics
clear, clf reset;
Amp = [1 0 1/3 0 1/5 0 1/7 0 1/9 0]/pi;
ph = (pi/2)*[ 1 1 1 1 1 1 1 1 1 1 ];
f = [220 233 247 262 277 294 311 330 249 270];
T = 1.5;
Fs = 16e3;
t = 0:1/Fs:T;
x = Amp'.*sin(2*pi*f'.*t + ph');
summed_x = sum(x);
plot(t(1:300),x(1, 1:300));

% Theoretical sampling constraint: F_s = N/T, 
% shannon's sampling theorem saying that if Fs> 2*max{f}, 
% then the sample adeutaely represent the original signal

% Task 2: Chords
clear, clf reset;
K = 3;
Amp = [4 4 4]; % 1 x 3
ph = [0 0 0]; % 1 x 3
Fs = 8e3;
f = [262 330 392]; % 1 x 3
T = 3;
t = 0:1/Fs:T; % 1 x 24001
x = Amp'.*sin(2*pi*f'.*t + ph'); % dim: (3 x 24001) by 3x1 (3x1 x 1x24001 + 3x1)
                                 %.*:element-wise multiplication
sound(x(1,:))   
sound(x(2,:))  
sound(x(3,:))                            
hold on;
figure (1)
plot(t(1:300),x(1, 1:300));
grid on;
xlabel('time - secs');
ylabel('signal with f = 262 Hz');
figure(2)
plot(t(1:300),x(2, 1:300));
grid on;
xlabel('time - secs');
ylabel('signal wiht f = 330 Hz');
figure(3)
plot(t(1:300),x(3, 1:300));
grid on;
xlabel('time - secs');
ylabel('signal wiht f = 392 Hz');
hold off;




% Task 1: Pure Tone
clear, clf reset;
Fs = 8e3;
Fs_new = 1e3;
f = [220 233 247 262 277 294 311 330 249 270 392 415];
w = 2*pi*f;
T = 3;
N = 300;
t_TN = (0:1:N)*(T/N); % or 0:1/Fs:T with more data points (0:1/8000:3), or (0:1:N-1)*(T/N) with -0.01 
t_fs = 0:1/Fs:T;
t = t_fs;
Amp = 1;
phi = 0;
x = zeros(length(f), length(t));    % 12 x 24001 or 12 x 301
for i = 1:length(f)
    x(i, :) = Amp * cos(w(i) * t + phi);
    sound(x(i, :));
end
figure;
grid on;
plot(x(:, 1:N));  

% Q3.2
% overlap of signals, resulting in a block of area with 3 x [-1, 1]

% Q3.3
% the sound pitch of the signal change correspond to the amplitude change

% Q3.4
% phi does not change the sound of signal 

% Q 3.5
% the sound quality gets worse; lots of detail lost; tones jump around
