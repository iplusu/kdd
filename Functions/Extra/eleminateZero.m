function [ filteredUnsIP, filteredMat ] = eleminateZero( unsIP, mat )
    filteredUnsIP = []; filteredMat = [];
    
    res = find(mat ~= 0);
    for idx = 1:length(res)
        filteredUnsIP = [filteredUnsIP; unsIP(res(idx))];
        filteredMat = [filteredMat; mat(res(idx))];
    end;
end

