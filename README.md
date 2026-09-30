# DERIVATIVES-PRICING
This repository contains code I wrote to price various derivatives. While the exercises are largely based on textbook problems, they reflect the kind of critical thinking that decision-making under uncertainty requires.
Although there is no reference to theory, the goal is to let the reader understand my pricing and coding skills — so feel free to reach out with any sensitivity-analysis questions, such as how and why the Greeks behave over time, how and why option prices respond to changes in their parameters, etc.

I used MATLAB for its general simplicity and built-in financial functions. To run a script, open it in MATLAB, set the input parameters at the top, and run.

# FOLDERS ORGANIZATION
1)The Option Pricing folder demonstrates my ability to price plain-vanilla, barrier, and lookback options — using Black-Scholes, the Cox-Ross-Rubinstein (CRR) binomial model, Monte Carlo simulation, and the Black formula — on different types of underlying assets, from stocks and indices to exchange rates and forward contracts. Last but not least, it also covers bond options, caps, floors, and collars, which require accounting for the stochastic nature of interest rates — leading me to study models such as Vasicek, Cox-Ingersoll-Ross (CIR), Black-Derman-Toy (BDT), and the Forward LIBOR Model.                                
2) Swaps Pricing Folder shows skills in pricing interest rate swaps, credit default swaps and quantos.

# SHARED NOTATION THROUGH THE CODE
Annotations regarding option pricing:
-S_0 is meant to be the underlying asset, regardless of its type, at time 0;
-K is the strike price;
-r is the risk free rate;
-T is the time to maturity;
-Sigma is the volatility;
-Sigma_imp is the implied volatility;
-The Greeks are referred to with their respective name (e.g. delta is called delta)

Annotations regarding swaps pricing:
- rates
