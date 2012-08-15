function [subs, intervals] = checkSubs(start,last,varargin)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if nargin==3
    thresh = varargin(1);
end
if nargin==4
    thresh = varargin(1);
    minWin = varargin(2); %measurements were taken at half second intervals
end

subs = zeros(last-start+1,1);
intervals = {};


for i=start:last
    [v,s]=findRegions(i);
    intervals{i}=[];
    temp=[];
    for j=1:2
        for k=1:2
            if length(s{j}{k})>0          
                subs(i)=1;
                inf = cat(2,ones(size(s{j}{k},1),1)*j,ones(size(s{j}{k},1),1)*k);
                temp = cat(1,temp,cat(2,s{j}{k},inf));
            end
        end
    end
    intervals{i}=temp;
end
                


end

