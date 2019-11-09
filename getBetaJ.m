function [betaJ] = getBetaJ(s,J,Ju,Ju2)

% getBetaJ calculate jump beta 
cov = 0;
var = 0;

for j = s:J
    cov = cov + Ju(j,1)*Ju2(j,1);
    var = var + Ju(j,1)^2;
end

betaJ = cov / var;
    
    