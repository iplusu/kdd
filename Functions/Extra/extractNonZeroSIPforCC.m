% Clean the workspace
function unsIPCC= extractNonZeroSIPforCC()

unsIPCC = [];
for i = 1:14
    load(['TempData/ccfsDay' int2str(i) '.mat']);
    [ unsIP, ccfs ] = eleminateZero( unsIP, ccfs );
    
    unsIPCC = [unsIPCC;unsIP];
    unsIPCC = unique(unsIPCC);
end;    
