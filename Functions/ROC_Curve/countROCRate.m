function mat = countROCRate(from, to, rate)

mat = [];

for idx = from:to
    %[TPR, FPR, TH, Y] = rocCurveDay(idx);
    [unSrc, d_Gb] = oneDayR(idx);
    transactions = sum(full(d_Gb));
    threshold = rate * transactions;
    fprintf('Day %d\ttransactions:%f\trate:%f\tTH:%f\n', idx, transactions, rate, threshold);
    [below, above] = countROC(threshold, d_Gb);
    mat = [mat;below above];
end;
mat = full(mat);