%% 2.1 Task 1: Make a single note
clear, clf reset; 


% define the variables
TD = 1.5; % time duration
nf = 440;  % note frequnecy to be played
nd = 4;  % duration of the note to be played (in 1,4,8, 16)
na = 1;  % note amplitude
Fs = 16e3; % sampling frequency
tt = 0:1/Fs:TD/nd; % 1 x 60001


% call mknote function
note_waveform = Q2_1_mknote(nf, TD/nd, na, tt);


% plot the note waveform vs. time
figure;
plot(note_waveform(1,:));
title('Note Waveform');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% play the note sound 
sound(note_waveform);

