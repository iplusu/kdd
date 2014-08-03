function [ AvgTPR, AvgFPR, TH ] = getAverageDegreeBase4()
    format longG;
    
    AvgTPR = [];
    AvgFPR = [];
    TH = [];
    
    load('TempData/DegreeData.mat');
    uDegree = [dshieldDegree; nonDshieldDegree];
    uDegree = sort(unique(uDegree));
    
    % Initialize the return data
    for idx = min(uDegree):max(uDegree)
    %     % Count the number of degrees that are greater than or equal to a unique degree.
    %     TPi = sum(dshieldTrust1(:,14) <= idx);
    %     % Count the number of degrees that are lesser than a unique degree.
    %     FPi = sum(nonDshieldTrust1(:,14) <= idx);
        
        TPi = dshieldDegree_summation / 14;
        TPi = TPi >= idx;
        TPi = sum(TPi);
        
        FNi = dshieldDegree_summation / 14;
        FNi = FNi < idx;
        FNi = sum(FNi);
        
        FPi = nonDshieldDegree_summation / 14;
        FPi = FPi >= idx;
        FPi = sum(FPi);

        TNi = nonDshieldDegree_summation / 14;
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