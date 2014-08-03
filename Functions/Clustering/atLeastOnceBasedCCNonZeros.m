function [ ALOCTTPR, ALOCTFPR, ALOCTH ] = atLeastOnceBasedCCNonZeros( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    ALOCTTPR = [];
    ALOCTFPR = [];
    ALOCTH = [];

    load('TempData/CCDataFiltered.mat');
        
    for idx = 0.0:0.01:1.0
        TPi = dshieldCC <= idx;
        TPi = sum(TPi, 2);
        TPi = sum(TPi >= 1);
        
        FNi = dshieldCC <= idx;
        FNi = sum(FNi, 2);
        FNi = sum(FNi < 1);
        
        FPi = nonDshieldCC <= idx;
        FPi = sum(FPi, 2);
        FPi = sum(FPi >= 1);
        
        TNi = nonDshieldCC <= idx;
        TNi = sum(TNi, 2);
        TNi = sum(TNi < 1);
        
        Pi = TPi + FNi;
        Ni = TNi + FPi;
        
        %Pi = TPi + FNi;
        %Ni = TNi + FPi;
    
        %fprintf('TPi:%d A_TPi:%d FPi:%d A_FPi:%d FNi:%d A_FNi:%d TNi:%d A_TNi:%d Pi:%d A_Pi:%d Ni:%d A_Ni:%d\n', TPi, A_TPi, FPi, A_FPi, FNi, A_FNi, TNi, A_TNi, TPi+FNi, Pi, TNi+FPi, Ni);
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