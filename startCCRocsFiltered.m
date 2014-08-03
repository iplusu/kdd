[ AVCCTTPR, AVCCTFPR, AVCCTH ] = AvgBasedCCNonZeros( );
[ EDCCTTPR, EDCCTFPR, EDCCTH ] = everyDayBasedCCNonZeros( );
[ ALOCTTPR, ALOCTFPR, ALOCTH ] = atLeastOnceBasedCCNonZeros( );

plot(AVCCTFPR, AVCCTTPR, '-*', ALOCTFPR, ALOCTTPR, '-*', EDCCTFPR, EDCCTTPR, '-*', 'LineWidth', 2), grid on, grid minor;
hleg1 = legend('Average','AtLeastOnce','EveryDay', 'Location','NorthEastOutside');
