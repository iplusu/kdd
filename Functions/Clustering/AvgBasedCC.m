function [ AVCCTTPR, AVCCTFPR, AVCCTH ] = AvgBasedCC( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    AVCCTTPR = [];
    AVCCTFPR = [];
    AVCCTH = [];

    load('TempData/CCData.mat');
        
    for idx = 0.01:0.01:1.0
        TPi = sum(dshieldCC, 2) / 14;
        TPi = sum(TPi <= idx & TPi > 0);
        
        FNi = sum(dshieldCC, 2) / 14;
        FNi = sum(FNi > idx | FNi == 0);
        
        FPi = sum(nonDshieldCC, 2) / 14;
        FPi = sum(FPi <= idx & FPi > 0);
        
        TNi = sum(nonDshieldCC, 2) / 14;
        TNi = sum(TNi > idx | TNi == 0);
        
        Pi = TPi + FNi;
        Ni = TNi + FPi;
    
        %Pi = TPi + FNi;
        %Ni = TNi + FPi;
    
        %fprintf('TPi:%d A_TPi:%d FPi:%d A_FPi:%d FNi:%d A_FNi:%d TNi:%d A_TNi:%d Pi:%d A_Pi:%d Ni:%d A_Ni:%d\n', TPi, A_TPi, FPi, A_FPi, FNi, A_FNi, TNi, A_TNi, TPi+FNi, Pi, TNi+FPi, Ni);
        % Prevent zero divisions.
        if Pi == 0
            AVCCTTPR = [AVCCTTPR TPi];
        else
            AVCCTTPR = [AVCCTTPR TPi/Pi];
        end;

        if Ni == 0
            AVCCTFPR = [AVCCTFPR FPi];
        else
            AVCCTFPR = [AVCCTFPR FPi/Ni];
        end;
        AVCCTH = [AVCCTH idx];
    end;
    AVCCTH = full(AVCCTH);
end