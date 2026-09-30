clear all;
%esercizio 17.28
S_0 = 300;
r = 0.08;
q = 0.03;
sigma = 0.20;
T=6/12; 
K = 300;
N=3;
Sadj  = S_0*exp(-r*q*T);

%
AmericanOpt = [0;1];
OptSpec ='put';

%date
Settle = '1-Jan-2003';
ValuationDate = '1-Jan-2003';
Maturity = '1-Jul-2003';

%specifiche per crrtree
STOCKSPEC =stockspec(sigma,S_0,'Continuous', q);
RateSpec = intenvset('Rates', r, ...
    'StartDates', Settle, ...
    'EndDates', Maturity , ...
    'Compounding',-1);

TimeSpec = crrtimespec(ValuationDate, Maturity, N);

Optiontree= crrtree(STOCKSPEC,RateSpec, TimeSpec);

%vediamo l'albero
disp(Optiontree);
treeviewer(Optiontree);

%specifiche per il price
ExerciseDates = Maturity;
PriceE = optstockbycrr(Optiontree,OptSpec,K,Settle, ExerciseDates,0);
fprintf('dopo 15 ore, il prezzo della put europea è = %.6f\n', PriceE);

[CallPriceE_conbls, PutPriceE_conbls] = blsprice(Sadj,K,r,T,sigma);
fprintf('il prezzo della put con bls è = %.6f\n', PutPriceE_conbls);

PriceA = optstockbycrr(Optiontree,OptSpec,K,Settle, ExerciseDates,1);
fprintf('il prezzo della put americana è = %.6f\n' , PriceA);