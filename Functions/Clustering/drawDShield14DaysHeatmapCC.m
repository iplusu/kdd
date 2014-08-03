function [ myFigure, cnt1, cnt2, cnt3 ] = drawDShield14DaysHeatmapCC( )
%DRAWDSHIELD14DAYSHEATMAPCC Summary of this function goes here
%   Detailed explanation goes here
    load('TempData\Dr.KatenkaAll.mat')
    class = kmeans(CC_DShield,3);
    cnt1 = sum(class == 1);
    cnt2 = sum(class == 2);
    cnt3 = sum(class == 3);
    
    [s,idx] = sort(class);
    imagesc(CC_DShield(idx,:));
    xlabel('Day', 'FontSize', 20);
    ylabel('Node', 'FontSize', 20);
    colorbar;
    myFigure = title('DShield 14 days CC Heatmap', 'FontSize', 20);
    
end

