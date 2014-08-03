function [ group1D, group1CC, group2D, group2CC, group3D, group3CC ] = separateDShieldDegreeGroups( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    group1D = [];group1CC = [];
    group2D = [];group2CC = [];
    group3D = [];group3CC = [];
    
    load('TempData\Dr.KatenkaAll.mat')
    class = kmeans(log(Degree_DShield+1),3);
    
    groupidx = find(class == 1);
    for idx = 1:length(groupidx)
        group1D = [group1D; Degree_DShield(groupidx(idx), :)];
        group1CC = [group1CC; CC_DShield(groupidx(idx), :)];
    end;
    
    groupidx = find(class == 2);
    for idx = 1:length(groupidx)
        group2D = [group2D; Degree_DShield(groupidx(idx), :)];
        group2CC = [group2CC; CC_DShield(groupidx(idx), :)];
    end;
    
    groupidx = find(class == 3);
    for idx = 1:length(groupidx)
        group3D = [group3D; Degree_DShield(groupidx(idx), :)];
        group3CC = [group3CC; CC_DShield(groupidx(idx), :)];
    end;
end

