function [ TrustTPR, TrustFPR, TH ] = getTrustBase( threshold )
    TrustTPR = [];
    TrustFPR = [];
    TH = [];
    
    load('TempData/DegreeData.mat');
    %[dshieldDegreeIP, dshieldDegree, dshieldDegree_summation] = getDshieldDegreeList(1, 14, threshold);
    %[nonDshieldDegreeIP, nonDshieldDegree, nonDshieldDegree_summation] = getNonDshieldDegreeList(1, 14, threshold);
    [dshieldUnsIP, dshieldTrust1] = calcTrust1(dshieldDegreeIP, dshieldDegree, threshold);
    [nonDshieldUnsIP, nonDshieldTrust1] = calcTrust1(nonDshieldDegreeIP, nonDshieldDegree, threshold);
    
    numOfDshield = length(dshieldDegreeIP);
    numOfNotInDshield = length(nonDshieldDegreeIP);
    lastDshieldTrust1 = dshieldTrust1(:, 14);
    lastNonDshieldTrust1 = nonDshieldTrust1(:, 14);
    
    for idx = 0.0:0.01:1.0
        dshieldCount = sum(lastDshieldTrust1(:) > idx);
        tmp = (dshieldCount/numOfDshield);
        %if(tmp > 1.0)   tmp = 1.0;	end;
        TrustTPR = [TrustTPR tmp];
        
        nonDshieldCount = sum(lastNonDshieldTrust1(:) > idx);
        tmp = (nonDshieldCount/numOfNotInDshield);
        %if(tmp > 1.0)   tmp = 1.0;	end;
        TrustFPR = [TrustFPR tmp];
        
        TH = [TH idx];
    end;
end

