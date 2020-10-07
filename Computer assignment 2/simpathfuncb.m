function [ST] = simpathfuncb(r, sigma, M, S0,T)
ST = NaN(M,1);

    for i = 1:M
        rnum = randn;
        ST(i) = S0 * exp((r-0.5*sigma^2)*T + sigma*sqrt(T)*rnum);
    end
end
