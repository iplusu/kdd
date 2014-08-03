function [ ] = drawAll14daysHalfdayHeatmap( num_groups )
%DRAWALL14DAYSHALFDAYHEATMAP Summary of this function goes here
%   Detailed explanation goes here
    load('TempData/HalfdayDegreeData.mat');
    %class = kmeans(log(dState+1), num_groups, 'start', 'uniform');
    class = kmeans(log(dState+1), num_groups);
    
    [s,idx] = sort(class);
    imagesc(log(dState(idx,:)));
    xlabel('Day', 'FontSize', 20);
    ylabel('Node', 'FontSize', 20);
    colorbar;
    myFigure = title(['All 14 days Halfday Heatmap - ' int2str(num_groups) 'Groups'], 'FontSize', 20);

end

