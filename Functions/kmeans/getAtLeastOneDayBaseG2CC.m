function [ ALOCTTPR, ALOCTFPR, ALOCTH ] = getAtLeastOneDayBaseG2CC( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    ALOCTTPR = [];
    ALOCTFPR = [];
    ALOCTH = [];

    load('TempData/kmeans3GroupsCC.mat');
        
    for idx = 0.01:0.01:1.0
        TPi = DShieldCCGrp2 <= idx & DShieldCCGrp2 > 0.0;
        TPi = sum(TPi, 2);
        TPi = sum(TPi >= 1);
        
        FNi = DShieldCCGrp2 <= idx & DShieldCCGrp2 > 0.0;
        FNi = sum(FNi, 2);
        FNi = sum(FNi < 1);
        
        FPi = nonDShieldCCGrp2 <= idx & nonDShieldCCGrp2 > 0;
        FPi = sum(FPi, 2);
        FPi = sum(FPi >= 1);
        
        TNi = nonDShieldCCGrp2 <= idx & nonDShieldCCGrp2 > 0;
        TNi = sum(TNi, 2);
        TNi = sum(TNi < 1);
        
        Pi = TPi + FNi;
        Ni = TNi + FPi;
        
        %Pi = TPi + FNi;
        %Ni = TNi + FPi;
    
        fprintf('TPi:%d\t FPi:%d\t FNi:%d\t TNi:%d\t Pi:%d\t Ni:%d\n', TPi, FPi, FNi, TNi, Pi, Ni);
        % Prevent zero divisions.
        if Pi == 0
            ALOCTTPR = [ALOCTTPR TPi];
        else
            ALOCTTPR = [ALOCTTPR TPi/Pi];
        end;

        if Ni == 0
            ALOCTFPR = [ALOCTFPR FPi];
        else
            ALOCTFPR = [ALOCTFPR FPi/Ni];
        end;
        ALOCTH = [ALOCTH idx];
    end;
    ALOCTH = full(ALOCTH);
end