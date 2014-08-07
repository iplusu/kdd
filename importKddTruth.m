%function [ sTime, sIP, sPort, dIP, dPort ] = importKdd( path )
function [ sTime, sIP, dIP, mal ] = importKddTruth( path )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    sTime = csvread(strcat(path, '/tcpdump.lllist_time.csv'));
    sIP = csvread(strcat(path, '/tcpdump.lllist_srcip_noperiod.csv'));
    %sPort = csvread(strcat(path, '/tcpdump.list_srcport.csv'));
    dIP = csvread(strcat(path, '/tcpdump.lllist_dstip_noperiod.csv'));
    mal = csvread(strcat(path, '/tcpdump.lllist_mal.csv'));
    %dPort = csvread(strcat(path, '/tcpdump.list_dstport.csv'));
end

