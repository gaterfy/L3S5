set PROD;
param prix{PROD} >= 0;
param impact{PROD} >= 0;
param budget >= 0;
param conMIN{PROD} >= 0;

var nb_min_page{m in PROD} >= conMIN[m];

maximize impacte : 
	 sum {m in PROD} impact[m] * nb_min_page[m];

subject to cbudget :
	sum {m in PROD} 
	    (prix[m] * nb_min_page[m]) <= budget;

data;
set PROD := TV magazine;
param budget = 100;
param:   prix impact conMIN :=
TV         2    1.8   10
magazine   1    1     0;