function [ myFigure, cnt1, cnt2, cnt3 ] = drawDShield14DaysHeatmap( )
%DRAWDSHIELD14DAYSHEATMAP Summary of this function goes here
%   Detailed explanation goes here
    load('TempData\Dr.KatenkaAll.mat')
    class = kmeans(log(Degree_DShield+1),3);
    [s,idx] = sort(class);
    imagesc(log(Degree_DShield(idx,:)));
    xlabel('Day', 'FontSize', 20);
    ylabel('Node', 'FontSize', 20);
    colorbar;
    myFigure = title('DShield 14 days Heatmap', 'FontSize', 20);
    cnt1 = sum(class == 1);
    cnt2 = sum(class == 2);
    cnt3 = sum(class == 3);
end

