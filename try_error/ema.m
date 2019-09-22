function val = ema0(n,prices)
    a = 0.15;
    %a = 0.07;
    
    len = length(prices);
    %fprintf('%d',l);
    if len == 0
        val = 0;
        return;
    end
    
    if n > len
        n = len
    end
    
    if n <= 1
        val = prices(1);
    else
        val = (1-a)*ema(n-1,prices) + a*prices(n);
    end
end
