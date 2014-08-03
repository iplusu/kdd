function [ group1ND, group1NCC, group2ND, group2NCC, group3ND, group3NCC ] = separateNonDShieldCCGroups( )
%SEPARATENONDSHIELDDEGREEGROUPS Summary of this function goes here
%   Detailed explanation goes here
    group1ND = [];group1NCC = [];
    group2ND = [];group2NCC = [];
    group3ND = [];group3NCC = [];
    
    load('TempData\Dr.KatenkaAll.mat')
    class = kmeans(CC_nonDShield,3);
    
    groupidx = find(class == 1);
    for idx = 1:length(groupidx)
        group1ND = [group1ND; Degree_nonDShield(groupidx(idx), :)];
        group1NCC = [group1NCC; CC_nonDshield(groupidx(idx), :)];
    end;
    
    groupidx = find(class == 2);
    for idx = 1:length(groupidx)
        group2ND = [group2ND; Degree_nonDShield(groupidx(idx), :)];
        group2NCC = [group2NCC; CC_nonDshield(groupidx(idx), :)];
    end;
    
    groupidx = find(class == 3);
    for idx = 1:length(groupidx)
        group3ND = [group3ND; Degree_nonDShield(groupidx(idx), :)];
        group3NCC = [group3NCC; CC_nonDshield(groupidx(idx), :)];
    end;
end

