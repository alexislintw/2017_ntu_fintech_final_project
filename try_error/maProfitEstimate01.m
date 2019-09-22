file='spy.csv';
fprintf('Reading %s...\n', file);
num=csvread(file, 1, 1);
adjClose=num(:,5);
windows=[5, 20, 60, 120, 240];
for i=1:length(windows)
	window=windows(i);
	figure; returnRate(i)=maProfitEstimate(adjClose, window, 1);
end

