function [ res ] = drawAll14DaysHeatmap( num_groups )
%DRAWALL14DAYSHEATMAP Summary of this function goes here
%   Detailed explanation goes here
    load('TempData\DegreeData.mat');
    res = zeros(num_groups, 3);
    allDegree = [dshieldDegree;nonDshieldDegree];
    class = kmeans(log(allDegree+1), num_groups, 'start', 'uniform');
    classDShield = class([1:length(dshieldDegree)], :);
    classNonDShield = class([(length(dshieldDegree)+1):length(allDegree)], :);
    
    for idx = 1:num_groups
        res(idx, 1) = idx;
        res(idx, 2) = sum(classDShield == idx);
        res(idx, 3) = sum(classNonDShield == idx);
        res(idx, 4) = res(idx, 2) + res(idx, 3);
    end;
    
    [s,idx] = sort(class);
    imagesc(log(allDegree(idx,:)));
    xlabel('Day', 'FontSize', 20);
    ylabel('Node', 'FontSize', 20);
    colorbar;
    myFigure = title(['All 14 days Heatmap - ' int2str(num_groups) 'Groups'], 'FontSize', 20);

end

