function [VarE] = getVarianceofBeta(s,J,Ju,ce,n)

up= 0;
low = 0;

for j = s:J
    up = up + Ju(j,1)*Ju(j,1)*ce(j,1);
    low = low + Ju(j,1)^2;
end
low = low^2;

VarE = up / low;
    