function [avgPayoff,endPrices,paths] = runpathsfunc2(r, sigma, deltaT, N, S0, M, K)
% Create empty matrix to store all paths. 
paths = NaN(N,M);

% Create empty vector to store all end prices.
endPrices = NaN(M,1);

% Run simpath function M times. 
for i = 1:M
    [endPrices(i), paths(1:N+1,i)] = simpathfunc2(r, sigma, deltaT, N, S0);
end

% Calculate payoffs at t = T and store it in a new vector. 
payoff = endPrices - K;
avgPayoff = mean(payoff);

