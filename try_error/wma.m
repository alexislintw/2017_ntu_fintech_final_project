function val = wma(n,prices)    
    len = length(prices);
    %fprintf('%d',l);
    if len == 0
        val = 0;
        return;
    end
    
    if n > len
        n = len
    end
    
    v1 = 0;
    v2 = 0;
    for i=0:(n-1)
        v1 = v1 + prices(i+1)*(n-i);
        v2 = v2 + n-i;
        val = v1/v2;
    end
end
