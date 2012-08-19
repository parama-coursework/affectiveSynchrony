function [data]= plotRegs(subjectNumber)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
lookup = 'ABCDFGHIJKLMNOPQRSTUVX';
subID = subjectNumber-1
%load subject's file
load(sprintf('%s0.xls.mat',lookup(subjectNumber)));

cf1 = eval(sprintf('Child_EDA_Foot_1_%d',subID));
cf2 = eval(sprintf('Child_EDA_Foot_2_%d',subID));
of1 = eval(sprintf('OT_EDA_Foot_1_%d',subID));
of2 = eval(sprintf('OT_EDA_Foot_2_%d',subID));
ses = eval(sprintf('Session_%d',subID));

%find out when sessions start and end

intervals = zeros(max(ses)+1,2);
intervals(size(intervals,1),2)=length(ses);

for i=2:length(ses)
    if ses(i)>ses(i-1)
        intervals(i+1,1)=i;
        intervals(i,2)=i-1;
    end
end
        
inty = intervals 



[s,int] = checkSubs(subjectNumber,subjectNumber);
mat = int{subjectNumber};

data={};

for i=1:size(mat,1)
    hold off
    figure('Units','pixels','Position',[1,1,1500,200])
    
    seslen = mat(i,2)-mat(i,1);
    seslen*100/100;
    seslenmin = seslen/120;
    sesstarttime = mat(i,1)/120;
    sesActStartTime = (mat(i,1)-intervals(ses(mat(i,1))+1,1))/120;
    x=0:1:seslen;
    x=x/120;

    eval(sprintf('data{i}.cf=cf%d(%d:%d);',mat(i,3),mat(i,1),mat(i,2)));
    eval(sprintf('data{i}.of=of%d(%d:%d);',mat(i,4),mat(i,1),mat(i,2)));
    
    eval(sprintf('p = plot(x,cf%d(%d:%d))',mat(i,3),mat(i,1),mat(i,2)));
    set(p,'Color','red','LineWidth',1);
    hold on
    eval(sprintf('q = plot(x,of%d(%d:%d))',mat(i,4),mat(i,1),mat(i,2)));
    set(q,'Color','blue','LineWidth',1);
    hTitle = title(sprintf('Child: %d | Session: %d | Start Time:%0.2f min | Total Duration:%.2f min',subjectNumber, ses(mat(i,1)),sesActStartTime, seslenmin));
    hXLabel = xlabel('Time (min)');
    hYLabel = ylabel('uS');
    legend('Child','Occupational Therapist');
    
    hereSessionMatVal = ses(mat(i,1))
    
    set( gca                       , ...
        'FontName'   , 'Arial' );
    set([hTitle, hYLabel], ...
        'FontName'   , 'AvantGarde');
    set([hYLabel]  , ...
        'FontSize'   , 10          );
    set( hTitle                    , ...
        'FontSize'   , 12          , ...
        'FontWeight' , 'bold'      );
    
    set(gca, ...
        'Box'         , 'on'     , ...
        'TickDir'     , 'in'     , ...
        'TickLength'  , [.005 .005] , ...
        'YGrid'       , 'off'      , ...
        'XColor'      , [.1 .1 .1], ...
        'YColor'      , [.1 .1 .1], ...
        'LineWidth'   , 1         );

    
    set(gcf, 'PaperPositionMode', 'auto');
    print(gcf, '-djpeg', sprintf('c%ds%dTS%dDur%df.jpg',subjectNumber, ses(mat(i,1)),round(sesstarttime), round(seslenmin)));
    print(gcf, '-djpeg', sprintf('/Users/parama 1/Sites/affectiveSynchrony/images/c%ds%dTS%dDur%d.jpg',subjectNumber, ses(mat(i,1)),round(sesActStartTime), round(seslenmin)));


    
    hold off
    %figure(2*(i-1)+2)
    figure('Units','pixels','Position',[1,1,1500,200])
    eval(sprintf('r = plot(x,(cf%d(%d:%d))/norm(cf%d(%d:%d)))',mat(i,3),mat(i,1),mat(i,2),mat(i,3),mat(i,1),mat(i,2)));
    set(r,'Color','red','LineWidth',1);
    hold on
    eval(sprintf('s = plot(x,(of%d(%d:%d))/norm(of%d(%d:%d)))',mat(i,4),mat(i,1),mat(i,2),mat(i,4),mat(i,1),mat(i,2)));
    set(s,'Color','blue','LineWidth',1);
    hTitle = title(sprintf('Child: %d | Session: %d | Start Time:%0.2f min| Total Duration:%.2f min',subjectNumber, ses(mat(i,1)),sesActStartTime, seslenmin));
    hXLabel = xlabel('Time (min)');
    legend('Child','Occupational Therapist');
    
    set( gca                       , ...
        'FontName'   , 'Arial' );
    set([hTitle, hYLabel], ...
        'FontName'   , 'AvantGarde');
    set([hYLabel]  , ...
        'FontSize'   , 10          );
    set( hTitle                    , ...
        'FontSize'   , 12          , ...
        'FontWeight' , 'bold'      );
    
    set(gca, ...
        'Box'         , 'on'     , ...
        'TickDir'     , 'in'     , ...
        'TickLength'  , [.005 .005] , ...
        'YGrid'       , 'off'      , ...
        'XColor'      , [.1 .1 .1], ...
        'YColor'      , [.1 .1 .1], ...
        'LineWidth'   , 1         );
    
    set(gcf, 'PaperPositionMode', 'auto');
    print(gcf, '-djpeg', sprintf('c%ds%dTS%iDur%inorm.jpg',subjectNumber, ses(mat(i,1)),round(sesstarttime), round(seslenmin)));
    print(gcf, '-djpeg', sprintf('/Users/parama/github/classes/affectiveSynchrony/data/analysis/images/c%ds%dTS%iDur%inorm.jpg',subjectNumber, ses(mat(i,1)),round(sesActStartTime), round(seslenmin)));
    
    hold off

%We subtract off baseline activation and normalize, then plot it again
% 
% 
% eval(sprintf('cy = cf%d(%d:%d)',mat(i,3),mat(i,1),mat(i,2)));
% eval(sprintf('oy = of%d(%d:%d)',mat(i,4),mat(i,1),mat(i,2)));

% optimal bandwidth suggested by Bowman and Azzalini (1997) p.31
% r.n=length(x)
% y=cy;
%     hcx=median(abs(x-median(x)))/0.6745*(4/3/r.n)^0.2;
%     hcy=median(abs(y-median(y)))/0.6745*(4/3/r.n)^0.2;
%     hc=sqrt(hcy*hcx);
% y=oy;
%     hox=median(abs(x-median(x)))/0.6745*(4/3/r.n)^0.2;
%     hoy=median(abs(y-median(y)))/0.6745*(4/3/r.n)^0.2;
%     ho=sqrt(hoy*hox);
    
%lets find the linear regression over approximately a 15 second period, or
%30 indices. 
% 
% numPts = round((seslen+1)/60)
% 
% creg = ksrlin(x,cy,hc,numPts);
% mcreg = creg.f
% mcreg = max(creg.f)
% mincreg = min(creg.f)
% oreg = ksrlin(x,oy,hc,numPts);
% 
% plot(creg.x,cregnorm,oreg.x,oregnorm)
    
end
end

