function [dshIP, action, summation] = getDshieldActiveList(from, to)

load('idetproject/dshield_list_full.mat');
action = [];

for idx = from:to
    load(['idetproject/data_may0' int2str(idx) '.mat']);
    [sIP, dIP] = removeIP(sIP, dIP, 2439063451);
    [sIP, dIP] = removeIP(sIP, dIP, 2439063452);
    udsIP = unique(sIP);
    [t,i] = ismember(dshIP, udsIP);
    action = [action t];
end;

summation = sum(action, 2);
action = action(find(summation > 0), :);
dshIP = dshIP(find(summation > 0), :);
summation = sum(action, 2);