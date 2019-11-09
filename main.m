% main.m
% This script when run should compute all values and make all plots
% required by the midterm.
% To do so, you must fill the functions in the functions/ folder,
% and create scripts in the scripts/ folder to make the required
% plots.

% Add folders to path
addpath('./functions/','./scripts/');

% Add plot defaults
plotDefaults;

%% Exercise1
%Input Values
N = 78
T = 2769
n = N-1
alpha = 5

%local variance estimator
kn = 7


% % Compute values
[dates,X] = loadStockData('C:\Users\wc145\ECON672\Projects\Data\SPY5min.csv',0)
[rDates, r] = getReturns(dates, X, N, T)
tau = getTimeOfDay(r,n,T)
cut = getThreshold(r, n, T, tau, alpha)
[rc,rd,count,J,tp,ip] = SeparateJumps(r,rDates, n, T, cut)
[dates,X2] = loadStockData('C:\Users\wc145\ECON672\Projects\Data\HD5min.csv',0)
[rDates, r2] = getReturns(dates, X2, N, T)

[av,cy] = CountJumpEveryYear(count,J,rd,tp,ip,n)
[Ju] = JumpOnly(J,r,tp,ip,n)
[Ju2] = JumpOnly(J,r2,tp,ip,n)
[betaJ] = getBetaJ(1,J,Ju,Ju2)

[re] = getError(r,r2,n,T,betaJ)
for q = 1:J
    [ce(q,1)]=getLocalVarianceofError(re,kn,tp(q,1),ip(q,1),n,r,cut);
end
[VarE] = getVarianceofBeta(1,J,Ju,ce,n)
sigmaE = sqrt((1/n)*VarE);
CI_upper = betaJ + 1.96*sigmaE;
CI_lower = betaJ - 1.96*sigmaE;

% seperate to two years
[betaJ1] = getBetaJ(1,35,Ju,Ju2)
[betaJ2] = getBetaJ(36,J,Ju,Ju2)
[re1] = getError(r,r2,n,T,betaJ1)
[re2] = getError(r,r2,n,T,betaJ2)
for q = 1:35
    [ce1(q,1)]=getLocalVarianceofError(re1,kn,tp(q,1),ip(q,1),n,r,cut);
end
for q = 36:J
    [ce2(q,1)]=getLocalVarianceofError(re2,kn,tp(q,1),ip(q,1),n,r,cut);
end
[VarE1] = getVarianceofBeta(1,35,Ju,ce1,n)
[VarE2] = getVarianceofBeta(36,J,Ju,ce2,n)
VarE12 = VarE1 + VarE2;
CI_up = betaJ1 - betaJ2 + 1.96*sqrt((1/n)*VarE12);
CI_low = betaJ1 - betaJ2 - 1.96*sqrt((1/n)*VarE12);

% Make plots
plot1B(Ju,Ju2,'HD');
plot1D(Ju,Ju2,J,betaJ,'HD');
