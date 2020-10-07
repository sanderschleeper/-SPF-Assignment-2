function [deltaVector, callValueVector, X] = replicatingPortfolio(paths, M, N, K, deltaT, sigma, r, T)

% Calculate hedging delta's.
deltaVector = NaN(N,M);

for i = 1:M
    for t = 1:N
        delta = (log(paths(t,i)/K)+(r+0.5*sigma^2)*(T - deltaT*(t-1)))/(sigma*sqrt(T - deltaT*(t-1)));
        deltaVector(t,i) = normcdf(delta);
    end
end

% For each t calculate call values using Black Scholes.
callValueVector = NaN(N+1,M);
for i = 1:M
    for t = 1:N+1
        [callValueVector(t,i), ~] = blsprice(paths(t,i), K, r, (T - deltaT*(t-1)), sigma);
    end
end

% For each t calculate portfolio values of stock and bond positions.
X = NaN(N+1,M);
X(1,1:M) = callValueVector(1);

for i = 1:M
    for t = 2:N+1
        X(t,i) = X(t-1,i) + deltaVector(t-1,i) * (paths(t,i) - paths(t-1,i)) ...
        + r*deltaT*(X(t-1,i)-(1-deltaVector(t-1,i))*X(t-1,i));
    end
end

end

