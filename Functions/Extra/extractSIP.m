% Clean the workspace
function unsIP= extractSIP()

unsIP = [];
for i = 1:14
    load(['idetproject/data_may0' int2str(i) '.mat']);
    [sIP, dIP] = removeIP(sIP, dIP, 2439063451);
    [sIP, dIP] = removeIP(sIP, dIP, 2439063452);
    
    unsIP = [unsIP;sIP];
    unsIP = unique(unsIP);
end;    
