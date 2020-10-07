function [endPrice,path] = simpathfunc2(r, sigma, deltaT, N, S0)
% Set S(0). 
s0 = S0;

% Create empty path vector. 
path = NaN(N:1);
path(1,1) = s0;

% Simulate 1 path of N steps and store each time step in vector path. 
for i = 1:N
    rnum = randn;
    %s0 = s0 + s0*(r*deltaT + sigma*sqrt(deltaT)*rnum);
    s0 = s0 + 0.04*s0*deltaT + sigma*sqrt(deltaT)*s0*randn;
    path(i+1,1) = s0;
end

% End price is the value of the final step in the simulated path. 
 endPrice = s0;
end

