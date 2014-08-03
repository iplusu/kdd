function [ res ] = calcAUC( TPR, FPR )
%CALCAUC Summary of this function goes here
%   Detailed explanation goes here
    %res = sum(abs(FPR(2:end) - FPR(1:end-1)) .* TPR(2:end));
    res = abs(trapz(FPR, TPR));
end

