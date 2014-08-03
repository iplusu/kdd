function mat = extractDshieldActiveRate(from, to)

[unsIP, action, rate] = dayByDayActive();
findResult = find(rate>=from & rate <=to);
mat = [unsIP(findResult,:) action(findResult,:) rate(findResult,:)];