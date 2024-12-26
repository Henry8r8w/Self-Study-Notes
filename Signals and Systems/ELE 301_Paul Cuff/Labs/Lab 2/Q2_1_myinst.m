function [ha, env] = Q2_1_myinst(d, t)
    ha = 1; % harmonic amplitude
    env = (t >= 0 & t <= d) .* exp(-1.5 * t); % exponential envelope
end