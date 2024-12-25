% Textbook Provided Code
clear;
t = -4:0.1:4; % Create time points in plot
f = zeros(size(t)); % Initialize function f(t)

% Construct function f(t)
for k = 1:length(t)
    if t(k) < 0
        f(k) = 0; 
    else
        f(k) = t(k);
    end
    if t(k) < -pi
        f(k) = t(k) + 2*pi;
    end
    if t(k) > pi
        f(k) = 0;
    end
end

% Initialize Fourier series with the mean term
fs = (pi / 4) * ones(size(t));

clf % Clear any figures

% Plot truncated Fourier Series for different harmonics
for n = 1:6
    % Add Fourier series terms
    fs = fs - (2/pi) * cos((2*n - 1) * t) / (2*n - 1)^2;
    fs = fs - (-1)^n * sin(n * t) / n;
    
    % Create subplot and plot Fourier series approximation
    subplot(3, 2, n);
    plot(t, fs, t, f, '--');
    
    % Add legend
    if n == 1
        legend('mean plus 1 term', 'f(t)', 'Location', 'best');
        legend boxoff;
    else
        legend(['mean plus ', num2str(n), ' terms'], 'f(t)', 'Location', 'best');
        legend boxoff;
    end
    
    % Add x-axis label for the last row
    if n >= 5
        xlabel('t');
    end
end
saveas(gcf,'harmonics_increase.png')