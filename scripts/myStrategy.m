% Alexis Lin, 20171229

function action=myStrategy(pastData)

window=4;
action=0;
currPrice=0;

if length(pastData) > 0
   currPrice=pastData(end).AdjClose;
   pastData=pastData(1:end-1); 
end

dataLen=length(pastData);
if dataLen<window
    mv=ema(window,pastData);
	return
end

windowData=pastData(end-window+1:end);
mv=ema(window,windowData);

if currPrice>mv
	action=-1;
elseif currPrice<mv
	action=1;
end

