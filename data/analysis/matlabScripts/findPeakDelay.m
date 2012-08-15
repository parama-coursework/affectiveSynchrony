function [cpeakdist, opeakdist] = findPeakDelay( cpeaks,otpeaks )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%find shorter
if(size(cpeaks,1)<size(otpeaks,1))
    sp = cpeaks
    shorter = cpeaks(:,2)
    lp = otpeaks;
    longer = otpeaks(:,2);
    ischiShorter = 1;
else
    sp = otpeaks;
    shorter = otpeaks(:,2);
    lp = cpeaks;
    longer = cpeaks(:,2);
    ischiShorter = 0;

end




%these vectors are for peak delay, they show how far away the nearest peak
%is from this one. 
nearestLonger = zeros(length(longer),1);
nearestShorter = zeros(length(shorter),1);

longerIs = longer;
shorterIs = shorter;

for i=1:length(longer)
    iForShorterIs=i;
    for j=1:length(shorter)
        currentdiff = 500000000;
        diff = abs(longer(i)-shorter(j));
        if diff<currentdiff
            currentdiff = diff;
        end
    end
    nearestLonger(i)=currentdiff;
    currentdiff = 500000000;
end


    
    
        

for i=1:length(shorter)
    shorterslen = length(shorter);
    currentdiff = 500000000;
    for j=1:length(longer)
        longerslen = length(longer);
        diff = abs(shorter(i)-longer(j));
        if diff<currentdiff
            currentdiff = diff;
        end
    end
    nearestShorter(i)=currentdiff;
    currentdiff = 500000000;
end



if ischiShorter
    cpeakdist = nearestShorter;
    opeakdist = nearestLonger;
else
    opeakdist = nearestShorter;
    cpeakdist = nearestLonger;
end
        
        
        