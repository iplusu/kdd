[ AVCCTTPR, AVCCTFPR, AVCCTH ] = AvgBasedCCNoEveryZeros( );
[ EDCCTTPR, EDCCTFPR, EDCCTH ] = everyDayBasedCCNoEveryZeros( );
[ ALOCTTPR, ALOCTFPR, ALOCTH ] = atLeastOnceBasedCCNoEveryZeros( );

plot(AVCCTFPR, AVCCTTPR, '-*', ALOCTFPR, ALOCTTPR, '-*', EDCCTFPR, EDCCTTPR, '-*', 'LineWidth', 2), grid on, grid minor;
hleg1 = legend('Average','AtLeastOnce','EveryDay', 'Location','NorthEastOutside');
