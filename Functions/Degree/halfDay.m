function [ firstHalfunsIP, firstHalfd_Gb, secondHalfunsIP, secondHalfd_Gb ] = halfDay( idx )
%HALFDAY Summary of this function goes here
%   Detailed explanation goes here
% Load all the data
    mat = oneDayTimeLine(idx);
    firstHalf = divideTimeLine(mat, 0, 86400/2);
    secondHalf = divideTimeLine(mat, (86400/2) + 1, 86400);
    
    firstHalfsIP = firstHalf(:,1);
    firstHalfdIP = firstHalf(:,2);
    secondHalfsIP = secondHalf(:,1);
    secondHalfdIP = secondHalf(:,2);
    
    [firstHalfsIP, firstHalfdIP] = removeIP(firstHalfsIP, firstHalfdIP, 2439063451);
    [firstHalfsIP, firstHalfdIP] = removeIP(firstHalfsIP, firstHalfdIP, 2439063452);
    
    firstHalfunsIP = unique(firstHalfsIP);
    firstHalfundIP = unique(firstHalfdIP);

    [t, nsIP] = ismember(firstHalfsIP, firstHalfunsIP);
    [t, ndIP] = ismember(firstHalfdIP, firstHalfundIP);

    tmpA = sparse(nsIP, ndIP, 1);
    firstHalfd_Gb = sum(tmpA > 0, 2);
    firstHalfd_Gb = full(firstHalfd_Gb);
    
    [secondHalfsIP, secondHalfdIP] = removeIP(secondHalfsIP, secondHalfdIP, 2439063451);
    [secondHalfsIP, secondHalfdIP] = removeIP(secondHalfsIP, secondHalfdIP, 2439063452);

    secondHalfunsIP = unique(secondHalfsIP);
    secondHalfundIP = unique(secondHalfdIP);

    [t, nsIP] = ismember(secondHalfsIP, secondHalfunsIP);
    [t, ndIP] = ismember(secondHalfdIP, secondHalfundIP);

    tmpA = sparse(nsIP, ndIP, 1);
    secondHalfd_Gb = sum(tmpA > 0, 2);
    secondHalfd_Gb = full(secondHalfd_Gb);
end

