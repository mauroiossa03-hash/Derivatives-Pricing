S0 = 38;
K = 40;
r = 0.16;
sigma = 0.35;
t = 0.5;

d1 = ((log(S0/K) + (r + 0.5*sigma^2)*t) )/ (sigma*sqrt(t));
d2 = d1 - sigma*sqrt(t);

P_Call = normcdf (d2);
P_Put = 1- normcdf(d2);

disp(P_Call);
disp(P_Put); 