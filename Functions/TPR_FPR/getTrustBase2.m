function [ TrustTPR, TrustFPR, TH ] = getTrustBase2( threshold )
    TrustTPR = [];
    TrustFPR = [];
    TH = [];
    
    load('TempData/DegreeData.mat');
    %[dshieldDegreeIP, dshieldDegree, dshieldDegree_summation] = getDshieldDegreeList(1, 14, threshold);
    [dshieldUnsIP, dshieldTrust1] = calcTrust1(dshieldDegreeIP, dshieldDegree, threshold);
    
    %[nonDshieldDegreeIP, nonDshieldDegree, nonDshieldDegree_summation] = getNonDshieldDegreeList(1, 14, threshold);
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
        tmp = 1 - (nonDshieldCount/numOfNotInDshield);
        %if(tmp > 1.0)   tmp = 1.0;	end;
        TrustFPR = [TrustFPR tmp];
        
        TH = [TH idx];
    end;
    format longG
    % Initialize the return data
    TrustTPR = [];
    TrustFPR = [];
    TH = [];

    % Calcuate the Trusts.
    load('TempData/DegreeData.mat');
    %[dshieldDegreeIP, dshieldDegree, dshieldDegree_summation] = getDshieldDegreeList(1, 14, threshold);
    %[nonDshieldDegreeIP, nonDshieldDegree, nonDshieldDegree_summation] = getNonDshieldDegreeList(1, 14, threshold);
    [dshieldUnsIP, dshieldTrust1] = calcTrust1(dshieldDegreeIP, dshieldDegree, threshold);
    [nonDshieldUnsIP, nonDshieldTrust1] = calcTrust1(nonDshieldDegreeIP, nonDshieldDegree, threshold);

    % Count the number of nodes in the DShield data on the day (TPi)
    % Count the number of nodes not in the DShield data on the day (FPi)
    %Pi = length(dshieldDegreeIP);
    %Ni = length(nonDshieldDegreeIP);

    for idx = 0:0.01:1.0
    %     % Count the number of degrees that are greater than or equal to a unique degree.
    %     TPi = sum(dshieldTrust1(:,14) <= idx);
    %     % Count the number of degrees that are lesser than a unique degree.
    %     FPi = sum(nonDshieldTrust1(:,14) <= idx);

        TPi = sum(dshieldTrust1(:,14) <= idx);
        FPi = sum(nonDshieldTrust1(:,14) <= idx);
        FNi = sum(dshieldTrust1(:,14) > idx);
        TNi = sum(nonDshieldTrust1(:,14) > idx);

        Pi = TPi + FNi;
        Ni = TNi + FPi;
    %      Pi = TPi + FPi;
    %      Ni = TNi + FNi;

        fprintf('TPi:%d\t FPi:%d\t FNi:%d\t TNi:%d\t Pi:%d\t Ni:%d\n', TPi, FPi, FNi, TNi, Pi, Ni);
        % Prevent zero divisions.
        if Pi == 0
            TrustTPR = [TrustTPR TPi];
        else
            TrustTPR = [TrustTPR TPi/Pi];
        end;

        if Ni == 0
            TrustFPR = [TrustFPR FPi];
        else
           tmp = 1- FPi/Ni;
            TrustFPR = [TrustFPR tmp];
        end;
        TH = [TH idx];
    end;
    TH = full(TH);
end

