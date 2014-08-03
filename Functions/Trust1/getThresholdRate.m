function [mat, rateMin, rateMax, rateMean, rateStd] = getThresholdRate(from, to, threshold)
mat = [];
for idx = from:to
    [unsIP, d_Gb] = oneDayR(idx);
    rate = threshold(idx)/sum(full(d_Gb));
    mat = [mat rate];
    fprintf('Day %d\tThreshold Rate:\t%f\t/\t%f\t=\t%f\n', idx, threshold(idx), sum(full(d_Gb)), rate);
end;

rateMin = min(mat);
rateMax = max(mat);
rateMean = mean(mat);
rateStd = std(mat);