[ AVCCTTPR, AVCCTFPR, AVCCTH ] = AvgBasedCC( );
[ EDCCTTPR, EDCCTFPR, EDCCTH ] = everyDayBasedCC( );
[ ALOCTTPR, ALOCTFPR, ALOCTH ] = atLeastOnceBasedCC( );

plot(AVCCTFPR, AVCCTTPR, '-*', ALOCTFPR, ALOCTTPR, '-*', EDCCTFPR, EDCCTTPR, '-*', 'LineWidth', 2), grid on, grid minor;
axis([0,1,0,1]);
hleg1 = legend('Average','AtLeastOnce','EveryDay', 'Location','NorthEastOutside');
