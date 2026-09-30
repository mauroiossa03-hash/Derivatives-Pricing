%esercizio 17.29C_0= 0.95;
sigma = 0.08;
rf_USA = 0.04;
rf_CAD = 0.05;

K = 0.95;
T= 9/12;

%bisogna ragionare come con i dividendi, o come con  i forward su cambi
%aggiusto il sottostante per il tasso rf_USA, perchè l'opzione è scritta
%sul cambio C_0

[call,put] = blsprice(C_adjusted,K,rf_CAD,T,sigma);
fprintf('il prezzo della Call è = %.6f\n', call);
fprintf('il prezzo della Put è = %.6f\n', put);

d1 = ( log(C_0/K) + (rf_CAD - rf_USA + 0.5*sigma^2)*T ) / ( sigma*sqrt(T) );
d2 = d1 - sigma*sqrt(T);

% Valori della normale cumulata
Nd1 = normcdf(d1);
Nd2 = normcdf(d2);

% Prezzo della call su cambio
call1 = C_0*exp(-rf_USA*T)*Nd1 - K*exp(-rf_CAD*T)*Nd2;

% Output
fprintf('d1 = %.4f\n', d1);
fprintf('d2 = %.4f\n', d2);
fprintf('N(d1) = %.4f\n', Nd1);
fprintf('N(d2) = %.4f\n', Nd2);
fprintf('Call FX = %.4f\n', call1);

%RELAZIONE PUT-CALL PARITY CON CAMBIO
Put = call1 + K* exp(-rf_CAD *T) - C_0* exp(-rf_USA*T);
fprintf('Il valore della put è % .6f\n', Put);

%queste correzioni vengono effettuate per la parità coperta dei cambi, ciò
%vuol dire che la strategia per cui:
%prendo a prestito al tasso rd ed investo in r_foreign, non deve permettere
%arbitraggio. Nella put call parity quindi il sottostante è attualizzato
%alla valuta estera, mentre lo strike alla valuta domestica, ed è proprio
%questo l'aggiustamento necessario.
