function [endPrices, avgPayoff] = runpathsfuncC(T, r, sigma, S0, M, K)
% Create empty vector to store end prices. 
endPrices = NaN(M,1);

% Generate M end prices. 
for i = 1:M
    rnum = randn;
    endPrices(i) = S0 * exp((r-0.5*sigma^2)*T + sigma*sqrt(T)*rnum);
end

payoff = endPrices - K;
avgPayoff = mean(payoff);
end