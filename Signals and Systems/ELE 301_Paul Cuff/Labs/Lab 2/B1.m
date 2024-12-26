%% 1.5 Generating a note: the instrument
% Our continuous-time signal (primitive): w_{d, f}(t) = sin(2*pi*f*t)(u(t) - u(t-d)) for t in [0, D]
% Note: w_{d,f}(t) does not actually produce instrumental sound, as higher-order harmonics and amplitude variations are not considered,
% and there is no signal envelope (rise and fall).

%% 1.4 Representing the score
% Let 1 represent a whole note, 2 represent a half note, 4 represent a quarter note, and 8 represent an eighth note.
% Given some defined variables in notes.m, to represent a few bars from morning mood, you can use the following matrices and scalar:

%% MUSIC: MORNING MOOD
%% ---------------------------------
% nf = Notes to play
% nd = Duration of each note: 8, 4, 2, 1 = 1/8, 1/4, 1/2, 1
% na = Relative amplitude of each note
% TD = Time duration of one whole note in seconds
nf = [G E D C D E G E D C D E G E G A2 E A2 G E D C];
nd = [4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4/5];
na = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
TD = 1.5;

%% ---------------------------------
% Note: Notice TD/nd(j) is the duration of each note in seconds.

%% 1.3 Notes
% Refer to the section table for the frequency of each note.

%% 1.2 Music Synthesis
% Let f represent frequency, d represent duration, and unit amplitude (A) played at time 0 yield w_{f, d}(t).
% Using j-th notation, we can construct the waveform described by the sum:
% m(t) = sum_{j=1}^{M} A_{j} w_{f_j, d_j}(t - tau_j)
% Note: Recall tau as the lagged sampling time if positive, and vice versa.

%% 1.1 .wav files
audiowrite(s, fs, N, 'c:/pathname/filename'); % Save s in .wav file format with quantization to N bits using fs sampling rate to the filename.
