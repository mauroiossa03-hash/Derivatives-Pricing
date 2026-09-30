
S0 = 50; %prezzo iniziale del sottostante
K = 50; %strike price
t = 3/12; % tempo alla scadenza
r = 0.10; % tasso di interesse privo di rischio
sigma = 0.3; % volatilità
q = 0; % dividend yield

[Call, Put] = blsprice(S0, K, r, t, sigma, q);
disp(['Call Option Price: ', num2str(Call)]);
disp(['Put Option Price: ', num2str(Put)]);

    % Calculate the implied volatility for the call option
impliedVol = blsimpv(S0, K, r, t, Call, q);
disp(['Implied Volatility: ', num2str(impliedVol)]);
