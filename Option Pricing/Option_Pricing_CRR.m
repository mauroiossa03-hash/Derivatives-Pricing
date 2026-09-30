%crr da solo
S_0 = 100;
K= 100;
T = 6/12;
r = 0.05;
sigma = 0.10;

N =3;
Valuation_Date = datetime(0,1,1);
Maturity = datetime(0,7,1);
SS = stockspec(sigma,S_0);
timespec= crrtimespec(Valuation_Date, Maturity ,N);
ratespec = intenvset('StartDates',Valuation_Date,'EndDates',Maturity, 'rates', r, 'compounding',1);
albero_crr= crrtree(SS,ratespec,timespec);


CALL = optstockbycrr(albero_crr,'call',K,Valuation_Date,Maturity,0);
fprintf('Il prezzo della call è = %.6f',CALL);

