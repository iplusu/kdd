function [unsIP, mat] = calcCCTrust1(unsIP, list)

mat = zeros(length(list), 14);

BBs = list;
BBs(BBs >= (0.9)) = 0;
BBs(BBs <= (0.1)) = 1;

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