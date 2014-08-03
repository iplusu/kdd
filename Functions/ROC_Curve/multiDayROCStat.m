function [mat, thMin, thMax, thMean, thStd] = multiDayROCStat(from, to, percentage)

mat = [];
per = percentage/100;

for idx = from:to
    %[TPR, FPR, TH] = rocCurveDay(idx);
    [TPR, FPR, TH] = calcRoc(idx);
    i = find(TPR > per, 1);
    mat = [mat TH(i)];
    fprintf('Day %d\tThreshold: %f\n', idx, TH(i));
end;

thMin = min(mat);
thMax = max(mat);
thMean = mean(mat);
thStd = std(mat);


