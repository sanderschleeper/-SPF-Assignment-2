function [endPrices, avgPayoff] = runpathsfunc(r, sigma, deltaT, N, S0, M, K)
% Create empty vector to store end prices. 
endPrices = NaN(M,1);

% Run simpath function M times and store end prices in vector. 
for i = 1:M
    endPrices(i) = simpathfunc(r, sigma, deltaT, N, S0);
end

% Calculate payoffs at t = T and store it in a new vector. 
payoff = endPrices - K;
avgPayoff = mean(payoff);