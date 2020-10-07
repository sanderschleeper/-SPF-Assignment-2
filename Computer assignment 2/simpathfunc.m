function [endPrice] = simpathfunc(r, sigma, deltaT, N, S0)
% Set S(0). 
s0 = S0;

% (Monte Carlo) Simulate 1 path of N steps. 
for i = 1:N
    rnum = randn;
    s0 = s0 + s0*(r*deltaT + sigma*sqrt(deltaT)*rnum);
end

% End price is the value of the final step in the simulated path. 
endPrice = s0;
end