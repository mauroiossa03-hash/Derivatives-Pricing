%15.13
T = 3/12;
S_0 = 50;
r= 0.10;
K = 50;
sigma = 0.3;

[call,put] = blsprice(S_0,K,r,T,sigma);
d1 = (log(S_0/K) + (r + 0.5*sigma^2)*T) / (sigma*sqrt(T));
d2 = d1 - sigma*sqrt(T);

C = S_0*normcdf(d1) - K*exp(-r*T)*normcdf(d2);
P_parity = C - S_0 + K*exp(-r*T);

fprintf('Call (formula)   = %.6f\n', C);
fprintf('Call (blsprice)  = %.6f\n', call);
fprintf('Put  (blsprice)  = %.6f\n', put);
fprintf('Put (putcall parity) = %.6f\n',P_parity);

%15.14
Dividendo = 1.5;
tD = 2/12;
%ragiono come con i forward, aggiusto il prezzo del sottostante
Sadj = S_0 - Dividendo* exp(-r* tD);
[callD,putD] = blsprice(Sadj,K,r,T,sigma);
fprintf('callD (blsprice) = %.6f\n', callD);
fprintf('putD (blsprice) = %.6f\n', putD);

%proviamo ora a calcolare il dividend yield
dy = Dividendo/S_0;
[Call_dy , put_dy] = blsprice(S_0,K,r,T,sigma,dy);
fprintf('call_dy (blsprice) = %.6f\n', Call_dy);
fprintf('put_dy (blsprice) = %.6f\n', put_dy);
%i prezzi vengono diversi perchè, dice chatgpt, il dividend yield va
%calcolato diversamente, con un regime di capitalizzazione composto

%calcoliamo le greche

[deltaCall,deltaPut] = blsdelta(S_0,K,r,T,sigma);
fprintf('deltacall = %.6f\n', deltaCall);
fprintf('deltaput = %.6f\n', deltaPut);

gamma = blsgamma(S_0,K,r,T,sigma);
fprintf('gamma = %.6f\n', gamma);

vega = blsvega(S_0,K,r,T,sigma);
fprintf('vega = %.6f\n', vega);

[rhoC, rhoP]= blsrho(S_0,K,r,T,sigma);
fprintf('rhoC = %.6f\n', rhoC);
fprintf('rhoP = %.6f\n', rhoP);

theta = blstheta(S_0,K,r,T,sigma);
fprintf('theta = %.6f\n', theta);

%15.16, in questo codice il 16 affianco alle variabili si riferisce chiaramente all'esercizio
r1= 0.16;
sigma1 = 0.35;
S = 38;
K1= 40;
T1= 6/12;
d1_16 = (log(S/K1)+ ((r1 + (sigma1^2)/2) * T1))/(sigma1* sqrt(T1));
d2_16 = d1_16 - sigma1*sqrt(T1);
prob1= normcdf(d1_16);
prob= normcdf(d2_16);

fprintf(' N(d1) = %.6f\n',prob1);
fprintf(' N(d2) = %.6f\n',prob);

[deltaC_16, deltaP_16] = blsdelta(S,K1,r1,T1,sigma1);
fprintf('deltacall_16 = %.6f\n', deltaC_16);
fprintf('deltaput_16 = %.6f\n', deltaP_16);
