function [ meanMat, stdMat, str ] = groupByGroup( grp )
%GROUPBYGROUP Summary of this function goes here
%   Detailed explanation goes here
    format longG;
    load('TempData/kmeans3Groups.mat');
    mat = [];
    str = [];
    
    if grp == 0
        mat = allDegree;
    elseif grp == 1
        mat = [DShieldGrp1;nonDShieldGrp1];
    elseif grp == 2
        mat = [DShieldGrp2;nonDShieldGrp2];
    elseif grp == 3
        mat = [DShieldGrp3;nonDShieldGrp3];
    else
        print('Please select a group between 0 and 4 (0 == ALL)');
    end;
    
    mat = log10(mat + 1);
    meanMat = mean(mat);
    stdMat = std(mat);
    
    for idx = 1:14
        %tmpStr = sprintf('%.2f (%.2f)', meanMat(idx), stdMat(idx));
        tmpStr = sprintf('%.2f (%.2f)', meanMat(idx), stdMat(idx));
        str = [str; tmpStr];
        str = cellstr(str);
    end;
end

