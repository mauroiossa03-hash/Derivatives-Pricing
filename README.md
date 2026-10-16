# Derivatives Pricing

MATLAB implementations of standard derivative pricing models, covering vanilla and path-dependent options, an interest rate model, and interest rate swaps. The goal is to show my pricing and coding skills, so feel free to reach out with questions on sensitivity analysis, such as how and why the Greeks behave over time, or how option prices respond to changes in their parameters.

## How to Run

I used MATLAB for its simplicity and built-in financial functions. To run a script, open it in MATLAB, set the input parameters at the top, and run.

## Folders

**Option Pricing** — plain-vanilla, barrier, and lookback options, priced with Black-Scholes, the Cox-Ross-Rubinstein (CRR) binomial model, and Monte Carlo simulation. It also includes a Black-Derman-Toy (BDT) interest rate model with a from-scratch no-arbitrage calibration.

**Swaps Pricing** — a 3-year plain-vanilla interest rate swap, priced by setting the present value of the fixed leg equal to that of the floating leg and solving for the par swap rate on a zero-coupon curve. Credit default swaps and quantos are planned.

## Notation

Option pricing:
- S₀: price of the underlying asset at time 0
- K: strike price
- r: risk-free rate
- T: time to maturity
- σ: volatility
- σ_imp: implied volatility
- The Greeks are referred to by their names (e.g., delta is called delta)

Swap pricing:
- N: notional amount
- DF(tᵢ): discount factor for payment date tᵢ
- τᵢ: year fraction of the i-th period
- K: fixed rate (the par swap rate, once solved)
- PV: present value
