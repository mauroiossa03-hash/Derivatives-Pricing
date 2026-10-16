% price_IRS.m - Par rate of a 3Y plain-vanilla interest rate swap
% PV_fixed = PV_float  =>  K = (1 - DF(T_n)) / sum_i( tau_i * DF(t_i) )

clear; clc;

Notional  = 10e6;
PayTimes  = (1:3)';                          % annual payments: 1Y, 2Y, 3Y
ZeroRates = [0.0300; 0.0330; 0.0350];        % continuously-compounded zero curve

DF  = exp(-ZeroRates .* PayTimes);
tau = diff([0; PayTimes]);

PV_float = Notional * (1 - DF(end));
Annuity  = sum(tau .* DF);
ParRate  = (1 - DF(end)) / Annuity;
PV_fixed = Notional * ParRate * Annuity;

fprintf('PV floating leg:  %.2f\n', PV_float);
fprintf('PV fixed leg:     %.2f\n', PV_fixed);
fprintf('Par swap rate:    %.4f%%\n', ParRate*100);
