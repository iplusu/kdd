function [ classAll, classDShield, classNonDShield ] = getKmeans( dshieldDegree, nonDshieldDegree, num_groups )
%GETKMEANS Summary of this function goes here
%   Detailed explanation goes here
    allDegree = [dshieldDegree;nonDshieldDegree];
    classAll = kmeans(log(allDegree+1), num_groups, 'start', 'uniform');
    classDShield = classAll([1:length(dshieldDegree)], :);
    classNonDShield = classAll([(length(dshieldDegree)+1):length(allDegree)], :);
end

