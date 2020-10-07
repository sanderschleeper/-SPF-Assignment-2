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
sigma  = 0.0438 * sqrt(252);


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
sigma  = 0.0438 * sqrt(252);


S0     = 3500.31;
M      = 10000;
K      = 3300;

%% Run function.
rng(1);
[endPrices, avgPayoff] = runpathsfunc(r, sigma, deltaT, N, S0, M, K);

% Calculate option value at t=0.
VS0 = exp(-r*T) * avgPayoff;

histogram(endPrices)

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
sigma  = 0.0438 * sqrt(252);


S0     = 3500.31;
M      = 10000;
K      = 3300;


S0     = 3500.31;
M      = 10000;
K      = 3300;

%% Run function.
rng(1);
[endPrices, avgPayoff] = runpathsfuncC(T, r, sigma, S0, M, K);

% Calculate option value at t=0.
VS0 = exp(-r*T) * avgPayoff

histogram(endPrices)

%% 2 (A). 

% Set variables.

T     = 1;
K     = 3300;
S0    = 3300;
sigma = 0.2007;
r     = 0.005;

% Calculate option value using Black Scholes. 

d1 = (log(S0) - log(K) + (r+1/2*sigma^2)*T) / sigma*sqrt(T);











    
