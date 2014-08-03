function mat = countROCList(from, to)

percentage = 90;
mat = [];

for idx = from:to
    %[TPR, FPR, TH, Y] = rocCurveDay(idx);
    [TPR, FPR, TH, d_Gb] = calcRoc(idx);
    thIdx = find(TPR>0.9, 1);
    fprintf('Day %d\tTPR:%f\tTH:%f\n', idx, TPR(thIdx), TH(thIdx));
    [below, above] = countROC(TH(thIdx), d_Gb);
    mat = [mat;below above];
end;
mat = full(mat);