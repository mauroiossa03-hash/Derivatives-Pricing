%esercizio bdt
B_1=95;B_2=93; B_3=91 ; B_4= 89;
sigma_1=0.20 ; sigma_2=0.25; sigma_3=0.20; sigma_4=0.18;

Prices = [B_1; B_2; B_3; B_4]; 
Maturities = [1; 2; 3; 4];
Valuation_date= datetime(0,1,1); %indichiamo il punto di partenza
EndDates = [ datetime(1,1,1); datetime(2,1,1); datetime(3,1,1); datetime(4,1,1) ]; %indichiamo le scadenze
Volatilita = [0.2; 0.25; 0.2; 0.18]; %indichiamo le volatilità
Rates = ( (100 ./ Prices) .^ (1 ./ Maturities) ) - 1; 

ratespec = intenvset('StartDates',Valuation_date,'EndDates',EndDates,'Rates',Rates,'Compounding',1,'Basis',1);
timespec= bdttimespec(Valuation_date,EndDates,1);
volspec= bdtvolspec(Valuation_date,EndDates,Volatilita);

bdt_tree=bdttree(volspec,ratespec,timespec);
disp(bdt_tree);
treeviewer(bdt_tree);

%prezzo opzione a 2 anni che ha come sottostante B_2-4
B_2_4 = B_4/B_2 *100;
K=93;
Exercisedate = datetime(2,1,1);
Settle = datetime(0,1,1);
Maturity = datetime(4,1,1);
optionprice = optbndbybdt(bdt_tree,'call',K,Exercisedate,0,0,Settle,Maturity);
fprintf('il prezzo della call è = %.6f',optionprice);