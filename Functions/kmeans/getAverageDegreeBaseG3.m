function [ AvgTPR, AvgFPR, TH ] = getAverageDegreeBaseG3()
    format longG;
    
    AvgTPR = [];
    AvgFPR = [];
    TH = [];
    
    load('TempData/kmeans3Groups.mat');
    uDegree = [DShieldGrp3; nonDShieldGrp3];
    uDegree = sort(unique(uDegree));
    
    % Initialize the return data
    for idx = min(uDegree):max(uDegree)
    %     % Count the number of degrees that are greater than or equal to a unique degree.
    %     TPi = sum(dshieldTrust1(:,14) <= idx);
    %     % Count the number of degrees that are lesser than a unique degree.
    %     FPi = sum(nonDshieldTrust1(:,14) <= idx);
        
        TPi = DShieldGrp3_Sum / 14;
        TPi = TPi >= idx;
        TPi = sum(TPi);
        
        FNi = DShieldGrp3_Sum / 14;
        FNi = FNi < idx;
        FNi = sum(FNi);
        
        FPi = nonDShieldGrp3_Sum / 14;
        FPi = FPi >= idx;
        FPi = sum(FPi);

        TNi = nonDShieldGrp3_Sum / 14;
        TNi = TNi < idx;
        TNi = sum(TNi);
        
        Pi = TPi + FNi;
        Ni = TNi + FPi;
    %      Pi = TPi + FPi;
    %      Ni = TNi + FNi;

        %fprintf('TPi:%d\t FPi:%d\t FNi:%d\t TNi:%d\t Pi:%d\t Ni:%d\n', TPi, FPi, FNi, TNi, Pi, Ni);
        % Prevent zero divisions.
        if Pi == 0
            AvgTPR = [AvgTPR TPi];
        else
            AvgTPR = [AvgTPR TPi/Pi];
        end;

        if Ni == 0
            AvgFPR = [AvgFPR FPi];
        else
            AvgFPR = [AvgFPR FPi/Ni];
        end;
        TH = [TH idx];
    end;
    TH = full(TH);
end