function [ res ] = calcAUCDay( day )
%CALCAUC Summary of this function goes here
%   Detailed explanation goes here
    [TP, FP, TH, d_Gb] = calcRoc(day);
    %res = sum(abs(FP(2:end) - FP(1:end-1)) .* TP(2:end));
    res = abs(trapz(FP, TP));
end

