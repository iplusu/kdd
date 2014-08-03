function [ ALOTPR, ALOTPRList, ALOFPR, ALOFPRList ] = getAtLeastOneDayBase( threshold )
    ALOTPRList = [];
    ALOFPRList = [];

    %[dshieldDegreeIP, dshieldDegree, dshieldDegree_summation] = getDshieldDegreeList(1, 14, 80);
    %[nonDshieldDegreeIP, nonDshieldDegree, nonDshieldDegree_summation] = getNonDshieldDegreeList(1, 14, 80);
    load('TempData/DegreeData.mat');
    
    numOfDshield = length(dshieldDegreeIP);
    numOfNotInDshield = length(nonDshieldDegreeIP);
    
    ALOTPRList = dshieldDegree >= threshold;
    ALOTPRList = sum(ALOTPRList, 2) >= 1;
    ALOTPR = sum(ALOTPRList)/numOfDshield;
    
    ALOFPRList = nonDshieldDegree >= threshold;
    ALOFPRList = sum(ALOFPRList, 2) >= 1;
    ALOFPR = sum(ALOFPRList)/numOfNotInDshield;
end

