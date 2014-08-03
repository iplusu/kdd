function [unsIP, mat] = calcTrust2(unsIP, list, th)

mat = zeros(length(list), 14);

BBs = list >= th;
GBs = list < th;

for idx1 = 1:14
    GB = zeros(length(list), 14); BB = zeros(length(list), 14);
    for idx2 = 1:idx1
        GB(:, 1) = GB(:, 1) + GBs(:, idx2);
        BB(:, 1) = BB(:, 1) + BBs(:, idx2);
    end;
    mat(:, idx1) = (GB(:, 1) + 1) ./ (GB(:, 1) + BB(:, 1) + 2);
end;