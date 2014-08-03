function [ myFigure, cnt1, cnt2, cnt3 ] = drawNonDShield14DaysHeatmapCC( )
%DRAWDSHIELD14DAYSHEATMAPCC Summary of this function goes here
%   Detailed explanation goes here
    load('TempData\Dr.KatenkaAll.mat')
    class = kmeans(CC_nonDshield,3);
    [s,idx] = sort(class);
    imagesc(CC_nonDshield(idx,:));
    xlabel('Day', 'FontSize', 20);
    ylabel('Node', 'FontSize', 20);
    colorbar;
    myFigure = title('NonDShield 14 days CC Heatmap', 'FontSize', 20);
    cnt1 = sum(class == 1);
    cnt2 = sum(class == 2);
    cnt3 = sum(class == 3);
end

