function plotdelay = plotsmooth( bp1, bp2)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

figure('Units','pixels','Position',[1,1,1500,200])
colormap('summer');
p=plot(bp1)
    set(p,'Color','red','LineWidth',1);
    hold on
q=plot(bp2)
    set(q,'Color','blue','LineWidth',1);
    hTitle = title('Child 4 | Session 1')
    hXLabel = xlabel('Time (min)');
    hYLabel = ylabel('uS');
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
    print(gcf, '-djpeg', 'c4s1bp.jpg');
    print(gcf, '-djpeg', '/Users/parama 1/Sites/affectiveSynchrony/images/c4s1bp.jpg');



end

