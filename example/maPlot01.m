% Plot moving average
%	Roger Jang, 20171110

close all; clear all;
%% Parameters and data
file='SPY.csv';
fprintf('Reading %s...\n', file);
num=csvread(file, 1, 1);
adjClose=num(:,5);
plot(adjClose);
windows=[5, 10, 20, 60, 120, 240];
for i=1:length(windows)
	window=windows(i);
	lineSet(:,i)=nanmean(enframe([nan*ones(window-1,1); adjClose], window, window-1))';
end
%% Plot of all data
plot([adjClose, lineSet]);
legend({'Price', '�g�u', '��g�u', '��u', '�u�u', '�b�~�u', '�~�u'}, 'location', 'northOutside', 'orientation', 'horizontal');
title('Global (10-year) view'); xlabel('Data index');
axis tight
%% Zoom in
figure;
plot([adjClose, lineSet]);
legend({'Price', '�g�u', '��g�u', '��u', '�u�u', '�b�~�u', '�~�u'}, 'location', 'northOutside', 'orientation', 'horizontal');
title('1-year view'); xlabel('Data index');
axis tight
start=1020; stop=start+240-1;
set(gca, 'xlim', [start stop]);
h=findobj(gca, 'type', 'line'); set(h, 'marker', '.');
%% Zoom in
figure;
plot([adjClose, lineSet]);
legend({'Price', '�g�u', '��g�u', '��u', '�u�u', '�b�~�u', '�~�u'}, 'location', 'northOutside', 'orientation', 'horizontal');
title('1-season view'); xlabel('Data index');
axis tight
start=1020; stop=start+60-1;
set(gca, 'xlim', [start stop]);
h=findobj(gca, 'type', 'line'); set(h, 'marker', '.');