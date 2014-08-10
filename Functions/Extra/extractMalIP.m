function [ list ] = extractMalIP( sIP, mal )
%EXTRACTMALIP Summary of this function goes here
%   Detailed explanation goes here
    list = find(mal > 0);
    list = sIP(list);
    list = unique(list);
end

