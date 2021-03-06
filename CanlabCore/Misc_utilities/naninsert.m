function yout = naninsert(nanvec, y)
    % yout = naninsert(nanvec, y)
    %
    % Insert NaNs back into data series from which they were removed
    % nanvec is indicator for NaNs, of size size(yout).  y is data.
    %
    % Tor Wager, July 2007; Bug fix, March 2008
    % See nanremove.m

    wh = find(nanvec);
    
    if isempty(wh), yout = y; return, end
    
    yout = zeros(size(nanvec));

    yout(1:wh(1) - 1) = y(1:wh(1) - 1);
    for i = 2:length(wh)
        ystart = wh(i-1) + 2 - i; % NaN index value - num previous removed; wh(i-1) + 1 - i + 1; 
        yend = wh(i) - i; % wh(i) - 1 - i + 1
        
        yout(wh(i-1) + 1 : wh(i) - 1) = y(ystart : yend);
    end
    % last segment
        i = i+1;
        if isempty(i), i = 2; end
        ystart = wh(end) + 2 - i;
        yout(wh(end)+1:end) = y(ystart:length(y));
    
    yout(wh) = NaN;

end