// Filename: regressions.do
// Author: Joseph Spada
// Descripion: runs regressions

clear all

******* BY ASSET *******
// import asset data
use "${data}\final_data.dta", clear

global MIN_YEAR = 2018
global MAX_YEAR = 2023

// using weighted_ucc
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 ucc change"
	reg ikchange`year'minus2016_w5 wgtd_uccchange`year'minus2016 if year == `year', robust
	estimates store ucc`year'
}
coefplot ucc2*, drop(_cons) yline(0) vertical xlabel(1 "2018" 2 "2019" 3 "2020" 4 "2021" 5 "2022" 6 "2023") leg(off) mcolor(red) ciopts(color(red)) ytitle("Regression Coefficient of Cumulative Change in Investment" "Rate on Cumulative Change in User Cost of Capital") ylabel(-6(.5)2)
graph export "$output/ucc_cumulative_weighted.png", replace


// using weighted_metr
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 metr change"
	reg ikchange`year'minus2016_w5 wgtd_metrchange`year'minus2016 if year == `year', robust
	estimates store metr`year'
}
coefplot metr2*, drop(_cons) yline(0) vertical xlabel(1 "2018" 2 "2019" 3 "2020" 4 "2021" 5 "2022" 6 "2023") leg(off) mcolor(red) ciopts(color(red)) ytitle("Regression Coefficient of Cumulative Change in Investment" "Rate on Cumulative Change in METR") ylabel(-0.3(0.05)0.1)
graph export "$output/metr_cumulative_weighted.png", replace


// now using the computer asset index instead of the 4 volatile computer assets


// using weighted_ucc
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 ucc change"
	reg ikchange`year'minus2016_w5comp wgtd_uccchange`year'minus2016 if year == `year', robust
	estimates store ucc`year'
}
coefplot ucc2*, drop(_cons) yline(0) vertical xlabel(1 "2018" 2 "2019" 3 "2020" 4 "2021" 5 "2022" 6 "2023") leg(off) mcolor(red) ciopts(color(red)) ytitle("Regression Coefficient of Cumulative Change in Investment" "Rate on Cumulative Change in User Cost of Capital") ylabel(-6(.5)2)
graph export "$output/ucc_cumulative_comp_weighted.png", replace

// metr
// weighted
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 metr change"
	reg ikchange`year'minus2016_w5comp wgtd_metrchange`year'minus2016 if year == `year', robust
	estimates store metr`year'
}
coefplot metr2*, drop(_cons) yline(0) vertical xlabel(1 "2018" 2 "2019" 3 "2020" 4 "2021" 5 "2022" 6 "2023") leg(off) mcolor(red) ciopts(color(red)) ytitle("Regression Coefficient of Cumulative Change in Investment" "Rate on Cumulative Change in METR") ylabel(-0.3(0.05)0.1)
graph export "$output/metr_cumulative_comp_weighted.png", replace

// DECOMPOSE TAU AND Z REGRESSIONS

// regressing on ucc_tauonly and ucc_bonus_only

forvalues year = 2018(1)2023{
	//di "regress `year' to 2016 investment change on `year' to 2016 ucc change (tau only)"
	//reg ikchange`year'minus2016_w5 wucctauonlychange`year'minus2016 if year == `year'
	//di "regress `year' to 2016 investment change on `year' to 2016 ucc change (bonus only)"
	//reg ikchange`year'minus2016_w5 wuccbonusonlychange`year'minus2016 if year == `year'
	di "regress `year' to 2016 investment change on `year' to 2016 ucc change (tau only) and ucc change (bonus only)"
	reg ikchange`year'minus2016_w5 wucctauonlychange`year'minus2016 wuccbonusonlychange`year'minus2016 if year == `year'
}
