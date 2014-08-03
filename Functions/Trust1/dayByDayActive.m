function [unsIP, action, rate] = dayByDayActive()

unsIP = extractSIP();
action = [];
rate = [];

for idx = 1:14
    load(['idetproject/dshield_may0' int2str(idx) '.mat']);
    [t,i] = ismember(unsIP, dshIP);
    action = [action t];
end;

rate = (sum(action,2)/14) * 100;