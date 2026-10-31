* This do file replicated figure 1a and 1b and the figures in the appendix

clear all
set more off

// Set Path to your the replication files folder
global master "replication files"


***************************************
//Polity IV
***************************************
import excel "$master/p4v2018-2.xls", sheet("p4v2017") firstrow
gen year_dummy=year
sort year_dummy
drop if year_dummy<=1973 //analysis for 1974 to 2014
drop if year_dummy>=2015
tab year

sort country // to make country data consistent

bys country: egen avg_democracy=mean(polity2) if inrange(year,1974,2018) //40 year average
keep if year==2014

keep country avg_democracy 

save "$master/Polity_IV.dta",replace

*****************************************
//Economic Survey Data
*****************************************
clear 

import excel "$master/ESfiscaldata.xlsx", sheet("Sheet1") firstrow

save "$master/ESfiscaldata.dta", replace

replace country="Korea South" if country=="Korea"
replace country="Dominican Republic" if country=="Dominican Rep."  
replace country="Philippines" if country=="Phillipines"
replace country="South Africa" if country=="S.Africa"

*COUNTRIES  found in Economic Survey of India but not present in Polity IV - Iceland and Malta

merge 1:1 country using "$master/Polity_IV.dta"

drop if _merge !=3

save "$master/Polity_EcoSurvey.dta", replace //merged datasets

********************************************************************************************************************
//Varibale for country labels
gen country_label=country
replace country_label="" if country != "India" & country !="China" & country!= "United States" & country != "Brazil" & country!="South Korea" & country != "Turkey" 

********************************************************************************************************************


// Figure 1a

su lpc_gdp
local lb=`r(min)'
local ub=`r(max)'

graph twoway (scatter tp_vp lpc_gdp, ml(country_label) mlabsize(small) mlabcolor(black) msize(small) mcolor(gs10)) ///
(lfit tp_vp lpc_gdp, lwidth(medium) lcolor(black) range(8.5 `ub')), ytitle("tax-payers relative to voting age population") xtitle("log gdp per capita") note("52 Counties in Sample") legend(off)

graph export "$master/figs/fig1a.eps", replace
graph export "$master/figs/fig1a.pdf", replace

// Figure 1b
// Control for Polity IV
regress tp_vp avg_democracy
predict res_1b, resid
lab var res_1b "Residual from the model"

regress lpc_gdp avg_democracy
predict res_2, resid
lab var res_2 "Residual from model"

graph twoway (scatter res_1b res_2, ml(country_label) mlabsize(small) mlabcolor(black) msize(small) mcolor(gs10)) ///
(lfit res_1b res_2, lwidth(medium) lcolor(black)), ytitle("tax-payers relative to voting age population" "controlling for democracy", size(small)) ///
xtitle("log gdp per capita" "controlling for democracy", size(small)) ///
note("52 Counties in Sample." "Variables have been residualized for avg Polity IV Score 1974-2018.") legend(off)

graph export "$master/figs/fig1b.eps", replace
graph export "$master/figs/fig1b.pdf", replace


*****************************************************************************************************************
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
* Appendix Figures 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
*****************************************************************************************************************

use "$master/wdi_2015", clear

su l_gdp_pc
local lb=`r(min)'
local ub=`r(max)'

graph twoway (lfit y l_gdp_pc if my_sample==1&indicator=="Access to electricity (% of population)", lwidth(medthin) lcolor(black) range(`lb' 10)) ///
(scatter y l_gdp_pc if my_sample==1&indicator=="Access to electricity (% of population)", msize(small) msymbol(Oh) mcolor(gs12)) ///
(scatter y l_gdp_pc if my_sample==0&ccd!="HIC"&indicator=="Access to electricity (% of population)", msize(vsmall) mcolor(black) mlabel(country) mlabcolor(black) mlabsize(small)) ///
(scatter y l_gdp_pc if ind==1&indicator=="Access to electricity (% of population)", msize(small) mcolor(red) mlabel(country) mlabcolor(black) mlabsize(small)), ///
legend(off) xlabel(5(2)12) xtitle("log GDP  per capita (constant 2010 US$)", size(medsmall)) ytitle("Access to electricity (% of population)", size(medsmall))

graph export "$master/figs/access_to_electricity_2015.pdf", replace

graph twoway (lfit y l_gdp_pc if my_sample==1&indicator=="People practicing open defecation (% of population)", lwidth(medthin) lcolor(black) range(`lb' 10)) ///
(scatter y l_gdp_pc if my_sample==1&indicator=="People practicing open defecation (% of population)", msize(small) msymbol(Oh) mcolor(gs12)) ///
(scatter y l_gdp_pc if my_sample==0&ccd!="LIC"&indicator=="People practicing open defecation (% of population)", msize(vsmall) mcolor(black) mlabel(country) mlabcolor(black) mlabsize(small)) ///
(scatter y l_gdp_pc if ind==1&indicator=="People practicing open defecation (% of population)", msize(small) mcolor(red) mlabel(country) mlabcolor(black) mlabsize(small)), ///
legend(off) xlabel(5(2)12) xtitle("log GDP  per capita (constant 2010 US$)", size(medsmall)) ytitle("% of population practicing open defecation", size(medsmall))

graph export "$master/figs/open_defecation_2015.pdf", replace
