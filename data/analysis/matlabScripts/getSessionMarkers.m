function [bookends] = getSessionMarkers( session )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

num = session(1);
vals = zeros(10,2);
vals(1,1)=1;

for i=1:length(session)
    if session(i)~=num
        vals(num+1,2)=i-1
        num = num+1
        vals(num+1,1)=i
    end
end

bookends = vals;
end

