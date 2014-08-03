[AOLTPR, AOLFPR, AOLTH]=getAtLeastOneDayBaseAllCC();
[AOLTPR1, AOLFPR1, AOLTH1]=getAtLeastOneDayBaseG1CC();
[AOLTPR2, AOLFPR2, AOLTH2]=getAtLeastOneDayBaseG2CC();
[AOLTPR3, AOLFPR3, AOLTH3]=getAtLeastOneDayBaseG3CC();

ALOAUC = calcAUC(AOLTPR, AOLFPR);
ALOAUC1 = calcAUC(AOLTPR1, AOLFPR1);
ALOAUC2 = calcAUC(AOLTPR2, AOLFPR2);
ALOAUC3 = calcAUC(AOLTPR3, AOLFPR3);

figure;
plot(AOLFPR, AOLTPR, '-ks', AOLFPR1, AOLTPR1, '-k+', AOLFPR2, AOLTPR2, '-ko', AOLFPR3, AOLTPR3, '-k.', 'LineWidth',2);grid on;
xlabel('FPR', 'FontSize', 20);ylabel('TPR', 'FontSize', 20);
title('ALO', 'FontSize', 20);hleg1 = legend('All', 'Grp1','Grp2','Grp3');set(hleg1,'Location','NorthWest');

[AvgTPR, AvgFPR, AvgTH]=getAverageDegreeBaseAllCC();
[AvgTPR1, AvgFPR1, AvgTH1]=getAverageDegreeBaseG1CC();
[AvgTPR2, AvgFPR2, AvgTH2]=getAverageDegreeBaseG2CC();
[AvgTPR3, AvgFPR3, AvgTH3]=getAverageDegreeBaseG3CC();

AvgAUC = calcAUC(AvgTPR, AvgFPR);
AvgAUC1 = calcAUC(AvgTPR1, AvgFPR1);
AvgAUC2 = calcAUC(AvgTPR2, AvgFPR2);
AvgAUC3 = calcAUC(AvgTPR3, AvgFPR3);

figure;
plot(AvgFPR, AvgTPR, '-ks', AvgFPR1, AvgTPR1, '-k+', AvgFPR2, AvgTPR2, '-ko', AvgFPR3, AvgTPR3, '-k.', 'LineWidth',2);grid on;
xlabel('FPR', 'FontSize', 20);ylabel('TPR', 'FontSize', 20);
title('Avg', 'FontSize', 20);hleg1 = legend('All', 'Grp1','Grp2','Grp3');set(hleg1,'Location','NorthWest');

[EDTPR, EDFPR, EDTH]=getEveryDayBaseAllCC();
[EDTPR1, EDFPR1, EDTH1]=getEveryDayBaseG1CC();
[EDTPR2, EDFPR2, EDTH2]=getEveryDayBaseG2CC();
[EDTPR3, EDFPR3, EDTH3]=getEveryDayBaseG3CC();

EDAUC = calcAUC(EDTPR, EDFPR);
EDAUC1 = calcAUC(EDTPR1, EDFPR1);
EDAUC2 = calcAUC(EDTPR2, EDFPR2);
EDAUC3 = calcAUC(EDTPR3, EDFPR3);

figure;
plot(EDFPR, EDTPR, '-ks', EDFPR1, EDTPR1, '-k+', EDFPR2, EDTPR2, '-ko', EDFPR3, EDTPR3, '-k.', 'LineWidth',2);grid on;
xlabel('FPR', 'FontSize', 20);ylabel('TPR', 'FontSize', 20);
title('Everyday', 'FontSize', 20);hleg1 = legend('All', 'Grp1','Grp2','Grp3');set(hleg1,'Location','NorthWest');
