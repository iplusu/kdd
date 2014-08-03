function [minMat, medianMat, meanMat, maxMat] = multiDayStatsFull(from, to)

days = to - from + 1;

minMat = zeros(2, days);
medianMat = zeros(2, days);
meanMat = zeros(2, days);
maxMat = zeros(2, days);

tarIdx = 1;
for idx = from:to
    [unsIP, d_Gb] = oneDayR(idx);
    [nonIP, nonDshield, inIP, inDshield] = separateDshieldFull(unsIP, d_Gb);
    
    [nonMinVal, nonMedianVal, nonMeanVal, nonMaxVal] = stats(nonDshield);
    [inMinVal, inMedianVal, inMeanVal, inMaxVal] = stats(inDshield);
    
    minMat(1, tarIdx) = nonMinVal;
    minMat(2, tarIdx) = inMinVal;
    medianMat(1, tarIdx) = nonMedianVal;
    medianMat(2, tarIdx) = inMedianVal;
    meanMat(1, tarIdx) = nonMeanVal;
    meanMat(2, tarIdx) = inMeanVal;
    maxMat(1, tarIdx) = nonMaxVal;
    maxMat(2, tarIdx) = inMaxVal;
    
    tarIdx = tarIdx + 1;
end;