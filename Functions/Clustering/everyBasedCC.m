function [ EDTTPR, EDTFPR, TH ] = everyDegreeThresholdBasedTrust( t_th )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    EDTTPR = [];
    EDTFPR = [];
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
        
        TPi = lastDshieldTrust1 <= t_th;
        TPi = sum(TPi, 2) >= 1;
        TPi = sum(TPi);
        
        FNi = lastDshieldTrust1 <= t_th;
        FNi = sum(FNi, 2) < 1;
        FNi = sum(FNi);
        
        FPi = lastNonDshieldTrust1 <= t_th;
        FPi = sum(FPi, 2) >= 1;
        FPi = sum(FPi);

        TNi = lastNonDshieldTrust1 <= t_th;
        TNi = sum(TNi, 2) < 1;
        TNi = sum(TNi);
        
        Pi = TPi + FNi;
        Ni = TNi + FPi;
    %      Pi = TPi + FPi;
    %      Ni = TNi + FNi;

        %fprintf('TPi:%d\t FPi:%d\t FNi:%d\t TNi:%d\t Pi:%d\t Ni:%d\n', TPi, FPi, FNi, TNi, Pi, Ni);
        % Prevent zero divisions.
        if Pi == 0
            EDTTPR = [EDTTPR TPi];
        else
            EDTTPR = [EDTTPR TPi/Pi];
        end;

        if Ni == 0
            EDTFPR = [EDTFPR FPi];
        else
            EDTFPR = [EDTFPR FPi/Ni];
        end;
        TH = [TH idx];
    end;
    TH = full(TH);
end

