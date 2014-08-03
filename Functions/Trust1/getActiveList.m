function [unsIP, action, summation] = getActiveList(from, to)

unsIP = extractSIP();
action = [];

for idx = from:to
    load(['idetproject/data_may0' int2str(idx) '.mat']);
    [t,i] = ismember(unsIP, sIP);
    action = [action t];
end;

summation = sum(action, 2);