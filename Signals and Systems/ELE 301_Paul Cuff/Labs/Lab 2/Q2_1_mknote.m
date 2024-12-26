function [n] = Q2_1_mknote(nf, TD, na, tt)
    n = zeros(length(nf), length(tt));
    for j = 1:length(nf)
        [ha, env] = Q2_1_myinst(TD, tt);
        n(j,:) = ha* na* sin(2*pi*nf(j)*tt) .* env; % Apply envelope
    end
end
