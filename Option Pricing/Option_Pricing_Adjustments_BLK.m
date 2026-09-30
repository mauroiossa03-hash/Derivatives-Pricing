%es17.11 hull dal manuale delle soluzioni
S = 696;
sigma = 0.30;
rf = 0.07;
q = 0.04;
K= 700;
T= 3/12;

%put price
S_0adj= S*exp(-q*T);
[call,put]= blsprice(S_0adj,K,rf,T,sigma);
fprintf('il prezzo della put è = %.6f',put);

[call1,put1] = blsprice(S,K,rf,T,sigma,q);
fprintf('il prezzo della put1 è = %.6f',put1);

S_blk= S*exp((rf-q)*T);
[callBLK,putBLK] = blkprice(S_blk,K,rf,T,sigma);
fprintf('il prezzo della put con blk è = %.6f',putBLK);





