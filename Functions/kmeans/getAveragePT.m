function [ avg ] = getAveragePT( grp, th )
%GETAVERAGEPT Summary of this function goes here
%   Detailed explanation goes here
    load('TempData/kmeans3Groups.mat');
    
    if grp == 1
        mat = [DShieldGrp1; nonDShieldGrp1];
    elseif grp == 2
        mat = [DShieldGrp2; nonDShieldGrp2];
    elseif grp == 3
        mat = [DShieldGrp3; nonDShieldGrp3];
    else
        print('No group.');
        exit();
    end;
    
    mat = calcPT(mat, th);
    avg = mean(mat);
end

