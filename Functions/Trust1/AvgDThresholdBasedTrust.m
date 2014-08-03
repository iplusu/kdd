function [ AVDTTPR, AVDTFPR, TH ] = AvgDegreeThresholdBasedTrust( t_th )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    AVDTTPR = [];
    AVDTFPR = [];
    TH = [];

    load('TempData/DegreeData.mat');
    uDegree = [dshieldDegree; nonDshieldDegree];
    uDegree = sort(unique(uDegree));
    
    for idx = min(uDegree):max(uDegree)
        [dshieldUnsIP, dshieldTrust1] = calcTrust2(dshieldDegreeIP, dshieldDegree, idx);
        [nonDshieldUnsIP, nonDshieldTrust1] = calcTrust2(nonDshieldDegreeIP, nonDshieldDegree, idx);
    
        numOfDshield = length(dshieldDegreeIP);
        numOfNotInDshield = length(nonDshieldDegreeIP);
        lastDshieldTrust1 = dshieldTrust1(:, 14);
        lastNonDshieldTrust1 = nonDshieldTrust1(:, 14);
        
        AVTPRList = [];
        AVFPRList = [];
    
        tmpList1 = dshieldDegree_summation / 14;
        tmpList1 = find(tmpList1 >= idx);
        for idx2 = 1:length(tmpList1)
            AVTPRList = [AVTPRList; lastDshieldTrust1(tmpList1(idx2))];
        end;

        tmpList2 = nonDshieldDegree_summation / 14;
        tmpList2 = find(tmpList2 >= idx);
        for idx2 = 1:length(tmpList2)
            AVFPRList = [AVFPRList; lastNonDshieldTrust1(tmpList2(idx2))];
        end;

        if isempty(tmpList1)
            TPi = 0;
            FNi = 0;
        else
            TPi = sum(AVTPRList(:,1) <= t_th);
            FNi = sum(AVTPRList(:,1) > t_th);
        end;
        
        if isempty(tmpList2)
            FPi = 0;
            TNi = 0;
        else
            FPi = sum(AVFPRList(:,1) <= t_th);
            TNi = sum(AVFPRList(:,1) > t_th);
        end;
        
        A_TPi = sum(dshieldTrust1(:,14) <= t_th);
        A_FPi = sum(nonDshieldTrust1(:,14) <= t_th);
        A_FNi = sum(dshieldTrust1(:,14) > t_th);
        A_TNi = sum(nonDshieldTrust1(:,14) > t_th);
        
        Pi = A_TPi + A_FNi;
        Ni = A_TNi + A_FPi;
        
        %Pi = TPi + FNi;
        %Ni = TNi + FPi;
    
        %fprintf('TPi:%d A_TPi:%d FPi:%d A_FPi:%d FNi:%d A_FNi:%d TNi:%d A_TNi:%d Pi:%d A_Pi:%d Ni:%d A_Ni:%d\n', TPi, A_TPi, FPi, A_FPi, FNi, A_FNi, TNi, A_TNi, TPi+FNi, Pi, TNi+FPi, Ni);
        % Prevent zero divisions.
        if Pi == 0
            AVDTTPR = [AVDTTPR TPi];
        else
            AVDTTPR = [AVDTTPR TPi/Pi];
        end;

        if Ni == 0
            AVDTFPR = [AVDTFPR FPi];
        else
            AVDTFPR = [AVDTFPR FPi/Ni];
        end;
        TH = [TH idx];
    end;
    TH = full(TH);
end