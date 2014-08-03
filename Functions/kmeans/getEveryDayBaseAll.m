function [ EveryTPR, EveryFPR, TH ] = getEveryDayBaseAll()
    format longG;
    
    EveryTPR = [];
    EveryFPR = [];
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
        
        TPi = dshieldDegree >= idx;
        TPi = sum(TPi, 2) == 14;
        TPi = sum(TPi);
        
        FNi = dshieldDegree >= idx;
        FNi = sum(FNi, 2) ~= 14;
        FNi = sum(FNi);
        
        FPi = nonDshieldDegree >= idx;
        FPi = sum(FPi, 2) == 14;
        FPi = sum(FPi);

        TNi = nonDshieldDegree >= idx;
        TNi = sum(TNi, 2) ~= 14;
        TNi = sum(TNi);
        
        Pi = TPi + FNi;
        Ni = TNi + FPi;
    %      Pi = TPi + FPi;
    %      Ni = TNi + FNi;

        %fprintf('TPi:%d\t FPi:%d\t FNi:%d\t TNi:%d\t Pi:%d\t Ni:%d\n', TPi, FPi, FNi, TNi, Pi, Ni);
        % Prevent zero divisions.
        if Pi == 0
            EveryTPR = [EveryTPR TPi];
        else
            EveryTPR = [EveryTPR TPi/Pi];
        end;

        if Ni == 0
            EveryFPR = [EveryFPR FPi];
        else
            EveryFPR = [EveryFPR FPi/Ni];
        end;
        TH = [TH idx];
    end;
    TH = full(TH);
end

