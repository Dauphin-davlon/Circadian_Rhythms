clear all; close all

%{
Run this file to load in example data (~1hr), extract ECG parameters and
produce a summary plot.
main outputs: 
mIBI : RR interval
params : PR interval, P width, PR seg, QRS, QT
mBeatWf : average sweep waveforms
%}


% hours = 1:5;
hours = 6:10;

for ix = 1:length(hours)

    hour = hours(ix);
    
    %load('example_data');
    %load('/Users/caseydiekman/Google Drive/My Drive/Summer-Research-2022/data/TSD-16_25aug_hour1.mat');
    load(sprintf('/Users/caseydiekman/Google Drive/My Drive/Summer-Research-2022/data/TSD-16_25aug_hour%d.mat',hour));
    
    [DN, mIBI, sdIBI, params, mBeatWf, Criteria, Quality, Diagnostic,points]=processECGexp_v2(data, ts);
    figure
    subplot(3,3,[1 4 7])
    plot(DN,mIBI),hold on, plot(DN,params)
    legend('RR','PRint','Pw','PRseg','QRS','QT')
    title('ECG features'), xlabel('Time (min)'), ylabel('duration (s)')
    use = randi(100,[6,1]); %select sweeps at random for example 
    x = (1:201)/256;
    if size(points,2)==8,points = points(:,[1 2 3 4 6 8]);end
    wins = [2 3 5 6 8 9];
    for i = 1:6
    subplot(3,3,wins(i))
    plot(x,mBeatWf(use(i),:))
    hold on
    scatter(x(points(use(i),:)),mBeatWf(use(i),points(use(i),:)))
    end
    xlabel('Time(s)')
    subplot(3,3,2)
    title('Example sweeps + feature detection')
    
    
    %% save the computed features for each hour to a CSV file
    output = [DN' mIBI' params];
    dlmwrite(sprintf('ECG_features_TSD-16_25aug_hour%d.csv',hour),output,'precision',10)


end

% % % % % %%
% % % % % 
% % % % % f=figure(2);
% % % % % plot(ts,data,'k','linewidth',3)
% % % % % xlim([0.0025 0.1025])
% % % % % set(gca,'Visible','off')
% % % % % %f.Position = [100 100 560 420];
% % % % % f.Position = [100 100 330 210];
% % % % % 
% % % % % figure(3)
% % % % % plot(ts,data,'k','linewidth',3)
% % % % % xlim([0.01 0.025])
% % % % % set(gca,'Visible','off')
% % % % % 
% % % % % %%
% % % % % 
% % % % % R1=x(points(use(i),4)); 
% % % % % R2=x(end)+R1;
% % % % % 
% % % % % P1=x(points(use(i),2)); 
% % % % % 
% % % % % Q1=x(points(use(i),3)); 
% % % % % Q2=x(end)+Q1;
% % % % % 
% % % % % T1=x(points(use(i),6)); 
% % % % % T2=x(end)+T1;
% % % % % 
% % % % % i=5;
% % % % % f=figure(4);
% % % % % plot(x,mBeatWf(use(i),:),'k','linewidth',3)
% % % % % hold on
% % % % % plot(x+x(end),mBeatWf(use(i),:),'k','linewidth',3)
% % % % % %scatter(x(points(use(i),:)),mBeatWf(use(i),points(use(i),:)),'ro','MarkerFaceColor','r','MarkerSize',16)
% % % % % %plot(x(points(use(i),:)),mBeatWf(use(i),points(use(i),:)),'ro','MarkerFaceColor','r','MarkerSize',12)
% % % % % ylim([-1.2 3.5])
% % % % % set(gca,'Visible','off')
% % % % % %f.Position = [100 100 560 420];
% % % % % f.Position = [100 100 330 210];
% % % % % 
% % % % % 
% % % % % plot([R1 R2],[2.7 2.7],'m','linewidth',5)
% % % % % text(0.6,3,'RR','fontsize',24,'interpreter','latex')
% % % % % plot([P1 R1],[-0.7 -0.7],'m','linewidth',5)
% % % % % text(P1-0.05,-1.2,'PR','fontsize',24,'interpreter','latex')
% % % % % plot([Q2 T2],[-0.7 -0.7],'m','linewidth',5)
% % % % % text(Q2+.05,-1.2,'QT','fontsize',24,'interpreter','latex')