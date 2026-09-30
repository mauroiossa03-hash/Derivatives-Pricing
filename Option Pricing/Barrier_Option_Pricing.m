%es cap 13 n9
clc; clear all; close all;

S0 = 100;      
K  = 110;       
T  = 1;         
r  = 0.08;      
sigma = 0.30;   
H = 90;         

dt = 1/252;
Nsteps = T / dt;

numSim = 10000;  

payoff_DOC = zeros(numSim,1);
payoff_DIC = zeros(numSim,1);

%% MONTE CARLO
for i = 1:numSim
    
    S = S0;
    barrier_hit = false;

    for t = 1:Nsteps
        dW = randn * sqrt(dt);
        S = S * exp((r - 0.5*sigma^2)*dt + sigma*dW);

        if S <= H
            barrier_hit = true;
        end
    end

    payoff_vanilla = max(S - K, 0);

    % Down-and-Out: payoff solo se NON tocca barriera
    if ~barrier_hit
        payoff_DOC(i) = payoff_vanilla;
    end

    % Down-and-In: payoff solo se tocca barriera
    if barrier_hit
        payoff_DIC(i) = payoff_vanilla;
    end
end

%% SCONTO A T=0
DOC_price = exp(-r*T) * mean(payoff_DOC);
DIC_price = exp(-r*T) * mean(payoff_DIC);

fprintf("Down-and-Out Call price (10.000 sims): %.4f\n", DOC_price);
fprintf("Down-and-In  Call price (10.000 sims): %.4f\n", DIC_price);

%% GRAFICO DEI PREZZI (una sola simulazione)
figure;
bar([DOC_price, DIC_price])
set(gca,'XTickLabel',{'DOC','DIC'})
ylabel('Prezzo stimato')
title('Down-and-Out e Down-and-In Call (10.000 simulazioni)')
grid on