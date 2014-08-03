function [ EDCCTTPR, EDCCTFPR, EDCCTH ] = getEveryDayBaseG3CC( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    EDCCTTPR = [];
    EDCCTFPR = [];
    EDCCTH = [];

    load('TempData/kmeans3GroupsCC.mat');
        
    for idx = 0.01:0.01:1.0
        TPi = DShieldCCGrp3 <= idx & DShieldCCGrp3 > 0;
        TPi = sum(TPi, 2);
        TPi = sum(TPi == 14);
        
        FNi = DShieldCCGrp3 <= idx & DShieldCCGrp3 > 0;
        FNi = sum(FNi, 2);
        FNi = sum(FNi ~= 14);
        
        FPi = nonDShieldCCGrp3 <= idx & nonDShieldCCGrp3 > 0;
        FPi = sum(FPi, 2);
        FPi = sum(FPi == 14);
        
        TNi = nonDShieldCCGrp3 <= idx & nonDShieldCCGrp3 > 0;
        TNi = sum(TNi, 2);
        TNi = sum(TNi ~= 14);
        
        Pi = TPi + FNi;
        Ni = TNi + FPi;
        
        %Pi = TPi + FNi;
        %Ni = TNi + FPi;
    
        %fprintf('TPi:%d A_TPi:%d FPi:%d A_FPi:%d FNi:%d A_FNi:%d TNi:%d A_TNi:%d Pi:%d A_Pi:%d Ni:%d A_Ni:%d\n', TPi, A_TPi, FPi, A_FPi, FNi, A_FNi, TNi, A_TNi, TPi+FNi, Pi, TNi+FPi, Ni);
        % Prevent zero divisions.
        if Pi == 0
            EDCCTTPR = [EDCCTTPR TPi];
        else
            EDCCTTPR = [EDCCTTPR TPi/Pi];
        end;

        if Ni == 0
            EDCCTFPR = [EDCCTFPR FPi];
        else
            EDCCTFPR = [EDCCTFPR FPi/Ni];
        end;
        EDCCTH = [EDCCTH idx];
    end;
    EDCCTH = full(EDCCTH);
end