function [unsIP, mat] = calcTrust1(unsIP, list, th)

mat = zeros(length(list), 14);

tmp1 = list >= th;
tmp2 = list;
tmp2((tmp2 >= th) | (tmp2 < (20))) = 0;
tmp2 = tmp2 ./ th;

BBs = tmp1 + tmp2;
GBs = ones(length(list), 14);
GBs = GBs - BBs;

for idx1 = 1:14
    GB = zeros(length(list), 14); BB = zeros(length(list), 14);
    for idx2 = 1:idx1
        GB(:, 1) = GB(:, 1) + GBs(:, idx2);
        BB(:, 1) = BB(:, 1) + BBs(:, idx2);
    end;
    mat(:, idx1) = (GB(:, 1) + 1) ./ (GB(:, 1) + BB(:, 1) + 2);
end;