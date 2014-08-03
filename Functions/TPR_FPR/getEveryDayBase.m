function [ EveryTPR, EveryTPRList, EveryFPR, EveryFPRList ] = getEveryDayBase( threshold )
    EveryTPRList = [];
    EveryFPRList = [];

    %[dshieldDegreeIP, dshieldDegree, dshieldDegree_summation] = getDshieldDegreeList(1, 14, 80);
    %[nonDshieldDegreeIP, nonDshieldDegree, nonDshieldDegree_summation] = getNonDshieldDegreeList(1, 14, 80);
    load('TempData/DegreeData.mat');
    
    numOfDshield = length(dshieldDegreeIP);
    numOfNotInDshield = length(nonDshieldDegreeIP);
    
    EveryTPRList = dshieldDegree >= threshold;
    EveryTPRList = sum(EveryTPRList, 2) == 14;
    EveryTPR = sum(EveryTPRList)/numOfDshield;
    
    EveryFPRList = nonDshieldDegree >= threshold;
    EveryFPRList = sum(EveryFPRList, 2) == 14;
    EveryFPR = sum(EveryFPRList)/numOfNotInDshield;
end

