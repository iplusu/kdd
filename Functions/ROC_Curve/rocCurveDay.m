function [TPR, FPR, TH, Y] = rocCurveDay(idx)

[unsIP, d_Gb] = oneDayR(idx);
[T, i] = veryfyTrueClassDshieldIP(unsIP, idx);
Y = full(d_Gb/max(d_Gb));

T = T';
Y = Y';

[TPR, FPR, TH] = roc(T,Y);
%plot(FPR, TPR);
%figure(gcf);