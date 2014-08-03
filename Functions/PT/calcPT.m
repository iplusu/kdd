function [ mat ] = calcPT( list, th )
%CALCPT Summary of this function goes here
%   Detailed explanation goes here
    listHeight = size(list, 1);
    listLength = size(list, 2);
    mat = zeros(listHeight, listLength);
    min_size = 2;
    
    BBs = list >= th;
    GBs = list < th;
    
    for idx1 = 1:listLength
        GPB = zeros(listHeight, listLength);
        BPB = zeros(listHeight, listLength);
        
        if  (idx1 == 1)     currentTrust = ones(listHeight, 1);
        else                currentTrust = mat(:, idx1 - 1);
        end;
        
        if (min_size >= idx1)   min_tmp = 1;
        else                    min_tmp = idx1 - min_size + 1;
        end;
        %display(min_tmp);
        %display(idx1);
        GPB(:, 1) = sum(GBs(:, min_tmp:idx1), 2);

        max_size = getWindowSize(currentTrust);
        for idx2 = 1:length(max_size)
            if (max_size(idx2,1) >= idx1)    max_tmp = 1;
            else                            max_tmp = idx1 - max_size(idx2, 1) + 1;
            end;
            BPB(idx2, 1) = sum(BBs(idx2, max_tmp:idx1), 2);
        end;

        mat(:, idx1) = (GPB(:, 1) + 1) ./ (GPB(:, 1) + BPB(:, 1) + 2);
    end;
end

