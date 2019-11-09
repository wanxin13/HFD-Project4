function [re] = getError(r,r2,n,T,betaJ)

% get error for linear regression on every time

for t = 1:T
    for i = 1:n
        re((t-1)*n+i,1) = r2((t-1)*n+i,1) - betaJ * r((t-1)*n+i,1);
    end
end