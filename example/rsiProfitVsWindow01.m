file='spy.csv';
fprintf('Reading %s...\n', file);
num=csvread(file, 1, 1);
adjClose=num(:,5);

windowMax=100;
lowTh=30;
highTh=80;

windows=1:windowMax;
for i=1:length(windows)
	window=windows(i);
	returnRate(i)=rsiProfitEstimate(adjClose, window, lowTh, highTh);
	fprintf('%d/%d: return=%g%%\n', window, windowMax, returnRate(i)*100);
end
%%
figure;
plot(windows, returnRate*100, 'marker', '.'); grid on
xlabel('Windows');
ylabel('Return rate (%)');
title('Return rate vs. windows');
[~, index]=max(returnRate);
line(index, returnRate(index)*100, 'color', 'r', 'marker', 'o');
fprintf('Best window=%d, max return rate=%g%%\n', index, 100*returnRate(index));
