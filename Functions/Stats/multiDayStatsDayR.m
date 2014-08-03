function [unsIP, d_Gb, minMat, medianMat, meanMat, maxMat, stdMat, ratioMat] = multiDayStatsDayR(from, to)

days = to - from + 1;

minMat = zeros(3, days);
medianMat = zeros(3, days);
meanMat = zeros(3, days);
maxMat = zeros(3, days);
stdMat = zeros(3, days);
ratioMat = zeros(2, days);

tarIdx = 1;
for idx = from:to
    [unsIP, d_Gb] = oneDayR(idx);
    if idx < 10
        fprintf('[Removed Day %d]\t\t-\tMAX: %d\n', idx, full(max(d_Gb)));
    else
        fprintf('[Removed Day %d]\t-\tMAX: %d\n', idx, full(max(d_Gb)));
    end;
    
%      if (idx > 7 & idx < 12) | idx == 14
%          d_Gb = refineDataIP(unsIP, d_Gb, 50000);
%      else
%          d_Gb = refineDataIP(unsIP, d_Gb, 20000);
%      end;
    
    [nonIP, nonDshield, inIP, inDshield] = separateDshieldFull(unsIP, d_Gb);
    
    [nonMinVal, nonMedianVal, nonMeanVal, nonMaxVal, nonStdVal] = stats(nonDshield);
    [inMinVal, inMedianVal, inMeanVal, inMaxVal, inStdVal] = stats(inDshield);
    [allMinVal, allMedianVal, allMeanVal, allMaxVal, allStdVal] = stats(d_Gb);
    
    minMat(1, tarIdx) = nonMinVal;
    minMat(2, tarIdx) = inMinVal;
    minMat(3, tarIdx) = allMinVal;
    
    medianMat(1, tarIdx) = nonMedianVal;
    medianMat(2, tarIdx) = inMedianVal;
    medianMat(3, tarIdx) = allMedianVal;
    
    meanMat(1, tarIdx) = nonMeanVal;
    meanMat(2, tarIdx) = inMeanVal;
    meanMat(3, tarIdx) = allMeanVal;
    
    maxMat(1, tarIdx) = nonMaxVal;
    maxMat(2, tarIdx) = inMaxVal;
    maxMat(3, tarIdx) = allMaxVal;

    stdMat(1, tarIdx) = nonStdVal;
    stdMat(2, tarIdx) = inStdVal;
    stdMat(3, tarIdx) = allStdVal;
    
    ratioMat(1, tarIdx) = length(nonDshield)/length(d_Gb);
    ratioMat(2, tarIdx) = length(inDshield)/length(d_Gb);
    
    tarIdx = tarIdx + 1;
end;