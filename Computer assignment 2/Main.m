%% 1 (A). 
% Set variables.

% T in years.
T      = 3/12;

% deltaT in years.
deltaT = 1/12;

% N = amount of steps.
N      = T / deltaT;

% r = continuously compounded interest rate per year.
r      = log((1+0.005/4)^4);

% sigma per year. 
sigma  = 0.0438 * sqrt(12);


S0     = 3500.31;
M      = 10000;
K      = 3300;

%% Run function.
% Set seed. 
rng(1);

% Simulate M paths. 
[endPrices, avgPayoff] = runpathsfunc(r, sigma, deltaT, N, S0, M, K);

% Calculate option value at t=0.
VS0 = exp(-r*T) * avgPayoff;

histogram(endPrices)

%% 1 (B).
% Set variables. 

% T in years.
T      = 3/12;

% deltaT in years.
deltaT = 1/252;

% N = amount of steps.
N      = T / deltaT;

% r = continuously compounded interest rate per year.
r      = log((1+0.005/4)^4);

% sigma per year. 
sigma  = 0.0438 * sqrt(12);


S0     = 3500.31;
M      = 10000;
K      = 3300;

%% Run function.
rng(1);
[endPrices, avgPayoff] = runpathsfunc(r, sigma, deltaT, N, S0, M, K);

% Calculate option value at t=0.
VS0 = exp(-r*T) * avgPayoff;

%% 1 (C).
% Set variables.

% T in years.
T      = 3/12;

% deltaT in years.
deltaT = 1/252;

% N = amount of steps.
N      = T / deltaT;

% r = continuously compounded interest rate per year.
r      = log((1+0.005/4)^4);

% sigma per year. 
sigma  = 0.0438 * sqrt(12);


S0     = 3500.31;
M      = 1000;
K      = 3300;

%% Run function.
rng(1);
[endPrices, avgPayoff] = runpathsfuncC(T, r, sigma, S0, M, K);

% Calculate option value at t=0.
VS0 = exp(-r*T) * avgPayoff;

%% 1 (D).
% Compare results with Black Scholes Option value. 
[Call, Put] = blsprice(S0, K, r, T, sigma)

%% 2 (A). 
% Set variables.

T       = 13/52;
deltaT  = 1/52;
K       = 3300;
S0      = 3300;
sigma   = 0.0438 * sqrt(12);
r       = log((1+0.005/4)^4);
N       = T / deltaT;
M       = 100;

% Calculate option value using Black Scholes. 
[callValue0, ~] = blsprice(S0, K, r, T, sigma);

%% 2 (B).

% Simulate 5000 paths, each path containing 13 weekly steps. 
[avgPayoff, endPrices, paths] = runpathsfunc2(r, sigma, deltaT, N, S0, M, K);

[deltaVector, callValueVector, X] = replicatingPortfolio(paths, M, N, K, deltaT, sigma, r, T);

% Calculate profit and loss of total position trader.
PL = X - callValueVector;

% Plot SPY paths, Call Option Values, Portfolio Values.
subplot(2,3,1)
plot(paths)
title('Simulated Prices Paths SP500')

subplot(2,3,2)
plot(deltaVector)
title('Hedging Deltas')

subplot(2,3,3)
plot(callValueVector)
title('Call Option Values')

subplot(2,3,4)
plot(X)
title('Replicating Portfolio Values')

subplot(2,3,5)
plot(mean(PL))
title('Average Profit and Losses Total Portfolio')

%% 2 (C).
% Set variables.

T       = 13/52;
deltaT  = 1/252;
K       = 3300;
S0      = 3300;
sigma   = 0.0438 * sqrt(12);
r       = log((1+0.005/4)^4);
N       = T / deltaT;
M       = 100;

% Calculate option value using Black Scholes. 
[callValue0, ~] = blsprice(S0, K, r, T, sigma);

% Simulate 5000 paths, each path containing 13 weekly steps. 
[avgPayoff, endPrices, paths] = runpathsfunc2(r, sigma, deltaT, N, S0, M, K);

[deltaVector, callValueVector, X] = replicatingPortfolio(paths, M, N, K, deltaT, sigma, r, T);

% Calculate profit and loss of total position trader.
PL = X - callValueVector;
mean(mean(PL))




    
