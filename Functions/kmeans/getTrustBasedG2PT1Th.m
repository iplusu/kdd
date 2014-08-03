function [ TrustTPR, TrustFPR, TH ] = getTrustBasedG2PT1Th( t_th )
%GETTRUSTBASEDG1PT Summary of this function goes here
%   Detailed explanation goes here
    TrustTPR = [];
    TrustFPR = [];
    TH = [];

    load('TempData/kmeans3Groups.mat');
    uDegree = [DShieldGrp2; nonDShieldGrp1];
    uDegree = sort(unique(uDegree));
    
    for idx = 0:10:200
        [ dshieldTrust1] = calcPT( DShieldGrp2, idx);
        [ nonDshieldTrust1] = calcPT( nonDShieldGrp2, idx);
    
        lastDshieldTrust1 = dshieldTrust1(:, 14);
        lastNonDshieldTrust1 = nonDshieldTrust1(:, 14);
        
        TrustTPRList = lastDshieldTrust1;
        TrustFPRList = lastNonDshieldTrust1;
        
        if isempty(TrustTPRList)
            TPi = 0;
            FNi = 0;
        else
            TPi = sum(TrustTPRList(:,1) <= t_th);
            FNi = sum(TrustTPRList(:,1) > t_th);
        end;
        
        if isempty(TrustFPRList)
            FPi = 0;
            TNi = 0;
        else
            FPi = sum(TrustFPRList(:,1) <= t_th);
            TNi = sum(TrustFPRList(:,1) > t_th);
        end;
        
        Pi = TPi + FNi;
        Ni = TNi + FPi;
        
        %Pi = TPi + FNi;
        %Ni = TNi + FPi;
    
        %fprintf('TPi:%d A_TPi:%d FPi:%d A_FPi:%d FNi:%d A_FNi:%d TNi:%d A_TNi:%d Pi:%d A_Pi:%d Ni:%d A_Ni:%d\n', TPi, A_TPi, FPi, A_FPi, FNi, A_FNi, TNi, A_TNi, TPi+FNi, Pi, TNi+FPi, Ni);
        % Prevent zero divisions.
        if Pi == 0
            TrustTPR = [TrustTPR TPi];
        else
            TrustTPR = [TrustTPR TPi/Pi];
        end;

        if Ni == 0
            TrustFPR = [TrustFPR FPi];
        else
            TrustFPR = [TrustFPR FPi/Ni];
        end;
        TH = [TH idx];
    end;
    TH = full(TH);

end

