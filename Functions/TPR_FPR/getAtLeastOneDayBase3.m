function [ ALOTPR, ALOTPRList, ALOFPR, ALOFPRList, TH ] = getAtLeastOneDayBase3( threshold )
    ALOTPRList = [];
    ALOFPRList = [];

    %[dshieldDegreeIP, dshieldDegree, dshieldDegree_summation] = getDshieldDegreeList(1, 14, 80);
    %[nonDshieldDegreeIP, nonDshieldDegree, nonDshieldDegree_summation] = getNonDshieldDegreeList(1, 14, 80);
    load('TempData/DegreeData.mat');
    [dshieldUnsIP, dshieldTrust1] = calcTrust1(dshieldDegreeIP, dshieldDegree, threshold);
    [nonDshieldUnsIP, nonDshieldTrust1] = calcTrust1(nonDshieldDegreeIP, nonDshieldDegree, threshold);
    
    numOfDshield = length(dshieldDegreeIP);
    numOfNotInDshield = length(nonDshieldDegreeIP);
    lastDshieldTrust1 = dshieldTrust1(:, 14);
    lastNonDshieldTrust1 = nonDshieldTrust1(:, 14);
    
    tmpList = dshieldDegree >= threshold;
    tmpList = sum(tmpList, 2) >= 1;
    tmpList = find(tmpList >= 1);
    for idx = 1:length(tmpList)
        ALOTPRList = [ALOTPRList; lastDshieldTrust1(tmpList(idx))];
    end;
    
    tmpList = dshieldDegree >= threshold;
    tmpList = sum(tmpList, 2) >= 1;
    tmpList = find(tmpList >= 1);
    for idx = 1:length(tmpList)
        ALOFPRList = [ALOFPRList; lastNonDshieldTrust1(tmpList(idx))];
    end;
    
    format longG
    % Initialize the return data
    ALOTPR = [];
    ALOFPR = [];
    TH = [];
    for idx = 0:0.01:1.0
    %     % Count the number of degrees that are greater than or equal to a unique degree.
    %     TPi = sum(dshieldTrust1(:,14) <= idx);
    %     % Count the number of degrees that are lesser than a unique degree.
    %     FPi = sum(nonDshieldTrust1(:,14) <= idx);

        TPi = sum(ALOTPRList(:,1) <= idx);
        FPi = sum(ALOFPRList(:,1) <= idx);
        FNi = sum(ALOTPRList(:,1) > idx);
        TNi = sum(ALOFPRList(:,1) > idx);

        Pi = TPi + FNi;
        Ni = TNi + FPi;
    %      Pi = TPi + FPi;
    %      Ni = TNi + FNi;

        fprintf('TPi:%d\t FPi:%d\t FNi:%d\t TNi:%d\t Pi:%d\t Ni:%d\n', TPi, FPi, FNi, TNi, Pi, Ni);
        % Prevent zero divisions.
        if Pi == 0
            ALOTPR = [ALOTPR TPi];
        else
            ALOTPR = [ALOTPR TPi/Pi];
        end;

        if Ni == 0
            ALOFPR = [ALOFPR FPi];
        else
            ALOFPR = [ALOFPR FPi/Ni];
        end;
        TH = [TH idx];
    end;
    TH = full(TH);
end

