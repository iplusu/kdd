threshold = 100;

% [ AvgTPR, AvgTPRList, AvgFPR, AvgFPRList, AvgTH ] = getAverageDegreeBase2( threshold );
% [ ALOTPR, ALOTPRList, ALOFPR, ALOFPRList, ALOTH ] = getAtLeastOneDayBase2( threshold );
% [ EveryTPR, EveryTPRList, EveryFPR, EveryFPRList, EveryTH ] = getEveryDayBase2( threshold );

[ AvgTPR, AvgFPR, AvgTH ] = getAverageDegreeBase4();
[ ALOTPR, ALOFPR, ALOTH ] = getAtLeastOneDayBase4();
[ EveryTPR, EveryFPR, EveryTH ] = getEveryDayBase4();

[ TrustTPR, TrustFPR, TH ] = calcTrustRoc( threshold );
[ TrustTPR2, TrustFPR2, TH ] = getTrustBase2( threshold );

%subplot(3,1,1), plot(TH, TrustTPR, TH, AvgTPR, TH, ALOTPR, TH, EveryTPR, 'LineWidth', 2), grid on, grid minor;
subplot(2,1,1), plot(TrustFPR, TrustTPR, AvgFPR, AvgTPR, ALOFPR, ALOTPR, EveryFPR, EveryTPR, 'LineWidth', 2), grid on, grid minor;
hleg1 = legend('Trust TPR','Average','AtLeastOnce','EveryDay', 'Location','NorthEastOutside');

% subplot(3,1,2), plot(TH, TrustFPR, TH, AvgFPR, TH, ALOFPR, TH, EveryFPR, 'LineWidth', 2), grid on, grid minor;
% hleg2 = legend('Trust FPR','Average','AtLeastOnce','EveryDay', 'Location','NorthEastOutside');

subplot(2,1,2), plot(TH, TrustTPR2, TH, TrustFPR2, 'LineWidth', 2), grid on, grid minor;
hleg3 = legend('Trust TPR','Trust FPR', 'Location','NorthEastOutside');