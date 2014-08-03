% Clean the workspace
function undIP= extractDIP()

undIP = [];
for i = 1:14
    load(['idetproject/data_may0' int2str(i) '.mat']);
    undIP = [undIP;dIP];
    undIP = unique(undIP);
end;    
