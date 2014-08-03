function [miniVal, medianVal, meanVal, maxVal, stdVal] = stats(matrix)
miniVal = min(matrix);
medianVal = median(matrix);
meanVal = mean(matrix);
maxVal = max(matrix);
stdVal = std(matrix);