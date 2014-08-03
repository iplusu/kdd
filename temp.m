figure;
plot(AOLFPR, AOLTPR, AvgFPR, AvgTPR, EDFPR, EDTPR, TrustFPRG01, TrustTPRG01, '--ok', TrustFPRG02, TrustTPRG02, '-+k', TrustFPRG03, TrustTPRG03, '-sk', TrustFPRG04, TrustTPRG04, '-*k', TrustFPRG05, TrustTPRG05, '-ok', TrustFPRG06, TrustTPRG06, '--+k', TrustFPRG07, TrustTPRG07, '--sk', TrustFPRG08, TrustTPRG08, '--*k', TrustFPRG09, TrustTPRG09, ':ok', 'LineWidth',3);grid on;
xlabel('FPR', 'FontSize', 20);ylabel('TPR', 'FontSize', 20);

title('All', 'FontSize', 20);hleg1 = legend('AtLeastOnce','Average','EveryDay', '0.1', '0.2', '0.3', '0.4', '0.5', '0.6', '0.7', '0.8', '0.9');set(hleg1,'Location','NorthEastOutside');

figure;
plot(AOLFPR1, AOLTPR1, AvgFPR1, AvgTPR1, EDFPR1, EDTPR1, TrustFPRG101, TrustTPRG101, '--ok', TrustFPRG102, TrustTPRG102, '-+k', TrustFPRG103, TrustTPRG103, '-sk', TrustFPRG104, TrustTPRG104, '-*k', TrustFPRG105, TrustTPRG105, '-ok', TrustFPRG106, TrustTPRG106, '--+k', TrustFPRG107, TrustTPRG107, '--sk', TrustFPRG108, TrustTPRG108, '--*k', TrustFPRG109, TrustTPRG109, ':ok', 'LineWidth',3);grid on;
xlabel('FPR', 'FontSize', 20);ylabel('TPR', 'FontSize', 20);

title('Group 1', 'FontSize', 20);hleg1 = legend('AtLeastOnce','Average','EveryDay', '0.1', '0.2', '0.3', '0.4', '0.5', '0.6', '0.7', '0.8', '0.9');set(hleg1,'Location','NorthEastOutside');

figure;
plot(AOLFPR2, AOLTPR2, AvgFPR2, AvgTPR2, EDFPR2, EDTPR2, TrustFPRG201, TrustTPRG201, '--ok', TrustFPRG202, TrustTPRG202, '-+k', TrustFPRG203, TrustTPRG203, '-sk', TrustFPRG204, TrustTPRG204, '-*k', TrustFPRG205, TrustTPRG205, '-ok', TrustFPRG206, TrustTPRG206, '--+k', TrustFPRG207, TrustTPRG207, '--sk', TrustFPRG208, TrustTPRG208, '--*k', TrustFPRG209, TrustTPRG209, ':ok', 'LineWidth',3);grid on;
xlabel('FPR', 'FontSize', 20);ylabel('TPR', 'FontSize', 20);

title('Group 2', 'FontSize', 20);hleg1 = legend('AtLeastOnce','Average','EveryDay', '0.1', '0.2', '0.3', '0.4', '0.5', '0.6', '0.7', '0.8', '0.9');set(hleg1,'Location','NorthEastOutside');

figure;
plot(AOLFPR3, AOLTPR3, AvgFPR3, AvgTPR3, EDFPR3, EDTPR3, TrustFPRG301, TrustTPRG301, '--ok', TrustFPRG302, TrustTPRG302, '-+k', TrustFPRG303, TrustTPRG303, '-sk', TrustFPRG304, TrustTPRG304, '-*k', TrustFPRG305, TrustTPRG305, '-ok', TrustFPRG306, TrustTPRG306, '--+k', TrustFPRG307, TrustTPRG307, '--sk', TrustFPRG308, TrustTPRG308, '--*k', TrustFPRG309, TrustTPRG309, ':ok', 'LineWidth',3);grid on;
xlabel('FPR', 'FontSize', 20);ylabel('TPR', 'FontSize', 20);

title('Group 3', 'FontSize', 20);hleg1 = legend('AtLeastOnce','Average','EveryDay', '0.1', '0.2', '0.3', '0.4', '0.5', '0.6', '0.7', '0.8', '0.9');set(hleg1,'Location','NorthEastOutside');