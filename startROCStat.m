count = countROCList(1,14);
[threshold, thMin, thMax, thMean, thStd] = multiDayROCStat(1, 14, 90);
[rate, rateMin, rateMax, rateMean, rateStd] = getThresholdRate(1,14,threshold);
countRate = countROCRate(1, 14, rateMean);