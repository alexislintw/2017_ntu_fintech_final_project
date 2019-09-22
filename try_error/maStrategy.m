function [action, mv]=maStrategy0(pastData, currPrice, window)
%maStrategy: Trading strategy based on moving average

% Alexis Lin, 20171229

%window=4;
action=0;
currPrice=0;

if length(pastData) > 0
   currPrice=pastData(end);
   %fprintf('--->>> %d\n',currPrice);
   pastData=pastData(1:end-1); 
end

dataLen=length(pastData);
if dataLen<window
	%mv=mean(pastData);
    mv=ema(window,pastData);
	return
end

windowData=pastData(end-window+1:end);
%mv=mean(windowData);
mv=ema(window,windowData);

if currPrice>mv
	action=-1;
elseif currPrice<mv
	action=1;
end

