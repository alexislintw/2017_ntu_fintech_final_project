function [action, rsi]=rsiStrategy(pastData, currPrice, window, lowTh, highTh)
%rsiStrategy: Trading strategy based on RSI

% Roger Jang, 20171126

action=0;
dataLen=length(pastData);
if dataLen<window
	priceDiff=pastData(2:end)-pastData(1:end-1);
	up=sum(priceDiff(priceDiff>0));
	down=-sum(priceDiff(priceDiff<0));
	rsi=up/(up+down)*100;
	return
end

windowData=pastData(end-window+1:end);
priceDiff=windowData(2:end)-windowData(1:end-1);
up=sum(priceDiff(priceDiff>0));
down=-sum(priceDiff(priceDiff<0));
rsi=up/(up+down)*100;

if rsi<lowTh
	action=1;
elseif rsi>highTh
	action=-1;
end