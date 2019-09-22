file='spy.csv';
fprintf('Reading %s...\n', file);
%offset 第二列 第二欄
num=csvread(file, 1, 1);
%adjClose=num(:,5);

windowMax=500;
windows=1:windowMax;
for i=1:length(windows)
	window=windows(i);
	returnRate(i)=maProfitEstimate(num, window);
	%fprintf('%d/%d: return=%g%%\n', window, windowMax, returnRate(i)*100);
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
axisLimit=axis;
line(5*[1 1], axisLimit(3:4), 'color', 'r');
line(10*[1 1], axisLimit(3:4), 'color', 'r');
line(20*[1 1], axisLimit(3:4), 'color', 'r');
line(60*[1 1], axisLimit(3:4), 'color', 'r');
line(120*[1 1], axisLimit(3:4), 'color', 'r');
line(240*[1 1], axisLimit(3:4), 'color', 'r');
line(480*[1 1], axisLimit(3:4), 'color', 'r');
h=text(5, axisLimit(3), '�g�u', 'rotation', 90, 'vertical', 'top');
h=text(10, axisLimit(3), '��g�u', 'rotation', 90, 'vertical', 'top');
h=text(20, axisLimit(3), '��u', 'rotation', 90, 'vertical', 'top');
h=text(60, axisLimit(3), '�u�u', 'rotation', 90, 'vertical', 'top');
h=text(120, axisLimit(3), '�b�~�u', 'rotation', 90, 'vertical', 'top');
h=text(240, axisLimit(3), '�~�u', 'rotation', 90, 'vertical', 'top');
h=text(480, axisLimit(3), '��~�u', 'rotation', 90, 'vertical', 'top');
