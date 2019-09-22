function val = ema(window,pastData)
    a = 0.15;
    
    len = length(pastData);
    if len == 0
        val = 0;
        return;
    end
    
    if window > len
        window = len
    end
    
    if window <= 1
        val = pastData(1).AdjClose;
    else
        val = (1-a) * ema(window-1,pastData) + a * pastData(window).AdjClose;
    end
end
