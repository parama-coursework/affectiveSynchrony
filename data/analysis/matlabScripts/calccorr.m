function [ winCorr,overCorr ] = calccorr( cin,oin, win,cnum,csess)
%UNTITLED Summary of this function goes here
%   takes in two arrays and outputs the correlation over a sliding window
%   as specified

out = ones(length(cin),1);
out2 = ones(length(cin),1); 
sizer = size(out)
outer = corrcoef(cin(1:win),oin(1:win))
mult = outer(1,2)
out(1:win,1)=out(1:win,1)*outer(1,2);
out2(1:win,1)=out2(1:win,1)*outer(1,2);
for i=(win+1):length(cin)
    foo=corrcoef(cin(i-win:i),oin(i-win:i));
    out(i)=foo(1,2);
end

for i=win:length(cin)
    foo=corrcoef(cin(1:i),oin(1:i));
    out2(i)=foo(1,2);
end

x=1:length(cin);
x=x/120;
z = zeros(length(cin),1);

figure(2)
plot(x,out2);
winCorr = out;
overCorr = out2;

figure('Units','pixels','Position',[1,1,1500,200])
colormap('jet');
h = plot(x,out);
hXLabel = xlabel('Time (min)')
hYLabel = ylabel('Correlation Coefficient')
hTitle = title(sprintf('Correlation Coefficient over %d second Sliding Window : Child %d, Session %s',win/2,cnum,csess));

%set(get(h(1),'BaseLine'),'LineWidth',2,'LineStyle',':')
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
        'YGrid'       , 'on'      , ...
        'XColor'      , [.1 .1 .1], ...
        'YColor'      , [.1 .1 .1], ...
        'LineWidth'   , 1         );

    
    set(gcf, 'PaperPositionMode', 'auto');
    print(gcf, '-djpeg', sprintf('c%ds%scorrWin.jpg',cnum,csess))
    print(gcf, '-djpeg', sprintf('/Users/parama 1/Sites/affectiveSynchrony/images/c%ds%scorrWin.jpg',cnum,csess));

figure()
figure('Units','pixels','Position',[1,1,1500,200])
colormap('jet');
h = plot(x,out2);
hXLabel = xlabel('Time (min)')
hYLabel = ylabel('Correlation Coefficient')
hTitle = title(sprintf('Correlation Coefficient from 0 to this point : Child %d, Session %s',cnum,csess));

%set(get(h(1),'BaseLine'),'LineWidth',2,'LineStyle',':')
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
        'YGrid'       , 'on'      , ...
        'XColor'      , [.1 .1 .1], ...
        'YColor'      , [.1 .1 .1], ...
        'LineWidth'   , 1         );

    
    set(gcf, 'PaperPositionMode', 'auto');
    print(gcf, '-djpeg', sprintf('c%ds%scorrOv.jpg',cnum,csess))
    print(gcf, '-djpeg', sprintf('/Users/parama 1/Sites/affectiveSynchrony/images/c%ds%scorrOv.jpg',cnum,csess));




    
end

