function [ AvgTPR, AvgTPRList, AvgFPR, AvgFPRList ] = getAverageDegreeBase( threshold )
    AvgTPRList = [];
    AvgFPRList = [];

    %[dshieldDegreeIP, dshieldDegree, dshieldDegree_summation] = getDshieldDegreeList(1, 14, 80);
    %[nonDshieldDegreeIP, nonDshieldDegree, nonDshieldDegree_summation] = getNonDshieldDegreeList(1, 14, 80);
    load('TempData/DegreeData.mat');
    
    numOfDshield = length(dshieldDegreeIP);
    numOfNotInDshield = length(nonDshieldDegreeIP);
    
    AvgTPRList = dshieldDegree_summation / 14;
    AvgTPRList = AvgTPRList(AvgTPRList >= threshold);
    AvgTPR = length(AvgTPRList)/numOfDshield;
    
    AvgFPRList = nonDshieldDegree_summation / 14;
    AvgFPRList = AvgFPRList(AvgFPRList >= threshold);
    AvgFPR = length(AvgFPRList)/numOfNotInDshield;
end

