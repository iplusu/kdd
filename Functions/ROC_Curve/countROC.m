function [below, above] = countROC(threshold, matrix)

below = sum(matrix < threshold);
above = sum(matrix >= threshold);
