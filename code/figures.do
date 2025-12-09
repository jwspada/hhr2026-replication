// Filename: figures.do
// Author: Joseph Spada
// Description: creates final tables

use "${data}\final_data.dta", clear

****** UCC GRAPHS ******

twoway ///
    line weighted_ucc year if bea_asset_code == "AE10", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "AE20", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "AE30", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "AE40", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "AE50", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "EI11", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EI12", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EI21", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EI22", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EI30", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EI40", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EI50", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EI60", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "ENS1", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "ENS2", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "ENS3", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "EO11", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EO12", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EO21", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EO22", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EO30", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EO40", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EO50", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EO60", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EO71", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EO72", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EO80", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EP12", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EP1A", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EP1B", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EP1D", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EP1E", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EP1G", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EP1H", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EP20", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EP31", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EP34", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EP35", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "EP36", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "ET11", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "ET12", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "ET20", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "ET30", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "ET40", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "ET50", lcolor(red) lpattern(dash) || ///
    line weighted_ucc year if bea_asset_code == "RD11", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD12", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD21", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD22", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD23", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD24", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD25", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD31", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD32", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD40", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD50", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD60", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD70", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD80", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD91", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "RD92", lcolor(black) || ///
	line weighted_ucc year if bea_asset_code == "RDOM", lcolor(black) || ///
    line weighted_ucc year if bea_asset_code == "SB10", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SB20", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SB31", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SB32", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SB41", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SB42", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SB43", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SB45", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SB46", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SC01", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SC02", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SC03", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SC04", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SI00", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SM01", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SM02", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SN00", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SO01", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SO02", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SO03", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SO04", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SOO1", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SOO2", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SU11", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SU12", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SU20", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SU30", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SU40", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SU50", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_ucc year if bea_asset_code == "SU60", lcolor(blue) lpattern(dash_dot) ///
    legend(label(1 "Intellectual Property Products") label(6 "Equipment") label(90 "Structures") pos(6) rows(1) order(1 6 90)) ///
	xline(2017.5) xlabel(1987(3)2023) ytitle("User Cost of Capital") xtitle("")

graph export "$output\ucc_all.png", replace
graph export "$output\fig4.eps", replace

****** METR GRAPHS ******

twoway ///
    line weighted_metr year if bea_asset_code == "AE10", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "AE20", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "AE30", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "AE40", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "AE50", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "EI11", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EI12", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EI21", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EI22", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EI30", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EI40", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EI50", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EI60", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "ENS1", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "ENS2", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "ENS3", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "EO11", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EO12", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EO21", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EO22", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EO30", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EO40", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EO50", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EO60", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EO71", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EO72", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EO80", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EP12", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EP1A", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EP1B", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EP1D", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EP1E", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EP1G", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EP1H", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EP20", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EP31", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EP34", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EP35", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "EP36", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "ET11", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "ET12", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "ET20", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "ET30", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "ET40", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "ET50", lcolor(red) lpattern(dash) || ///
    line weighted_metr year if bea_asset_code == "RD11", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD12", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD21", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD22", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD23", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD24", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD25", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD31", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD32", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD40", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD50", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD60", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD70", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD80", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD91", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "RD92", lcolor(black) || ///
	line weighted_metr year if bea_asset_code == "RDOM", lcolor(black) || ///
    line weighted_metr year if bea_asset_code == "SB10", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SB20", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SB31", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SB32", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SB41", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SB42", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SB43", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SB45", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SB46", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SC01", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SC02", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SC03", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SC04", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SI00", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SM01", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SM02", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SN00", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SO01", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SO02", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SO03", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SO04", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SOO1", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SOO2", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SU11", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SU12", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SU20", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SU30", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SU40", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SU50", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_metr year if bea_asset_code == "SU60", lcolor(blue) lpattern(dash_dot) ///
    legend(label(1 "Intellectual Property Products") label(6 "Equipment") label(90 "Structures") pos(6) rows(1) order(1 6 90)) ///
	xline(2017.5) xlabel(1987(3)2023) ytitle("Marginal Effective Tax Rate") xtitle("") yline(0)

graph export "$output\metr_all.png", replace
graph export "$output\fig7.eps", replace


****** RHO GRAPHS ******

twoway ///
    line weighted_rho year if bea_asset_code == "AE10", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "AE20", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "AE30", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "AE40", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "AE50", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "EI11", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EI12", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EI21", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EI22", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EI30", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EI40", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EI50", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EI60", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "ENS1", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "ENS2", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "ENS3", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "EO11", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EO12", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EO21", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EO22", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EO30", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EO40", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EO50", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EO60", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EO71", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EO72", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EO80", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EP12", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EP1A", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EP1B", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EP1D", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EP1E", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EP1G", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EP1H", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EP20", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EP31", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EP34", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EP35", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "EP36", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "ET11", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "ET12", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "ET20", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "ET30", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "ET40", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "ET50", lcolor(red) lpattern(dash) || ///
    line weighted_rho year if bea_asset_code == "RD11", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD12", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD21", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD22", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD23", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD24", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD25", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD31", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD32", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD40", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD50", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD60", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD70", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD80", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD91", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "RD92", lcolor(black) || ///
	line weighted_rho year if bea_asset_code == "RDOM", lcolor(black) || ///
    line weighted_rho year if bea_asset_code == "SB10", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SB20", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SB31", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SB32", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SB41", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SB42", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SB43", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SB45", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SB46", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SC01", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SC02", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SC03", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SC04", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SI00", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SM01", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SM02", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SN00", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SO01", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SO02", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SO03", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SO04", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SOO1", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SOO2", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SU11", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SU12", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SU20", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SU30", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SU40", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SU50", lcolor(blue) lpattern(dash_dot) || ///
    line weighted_rho year if bea_asset_code == "SU60", lcolor(blue) lpattern(dash_dot) ///
    legend(label(1 "Intellectual Property Products") label(6 "Equipment") label(90 "Structures") pos(6) rows(1) order(1 6 90)) ///
	xline(2017.5) xlabel(1987(3)2023) ytitle("Cost of Capital (rho)") xtitle("")

graph export "$output\rho_all.png", replace
graph export "$output\fig6.eps", replace


// first difference ucc

bysort bea_asset_code (year): gen first_diff_ucc = weighted_ucc - weighted_ucc[_n - 1]

twoway ///
    line first_diff_ucc year if bea_asset_code == "AE10", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "AE20", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "AE30", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "AE40", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "AE50", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "EI11", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EI12", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EI21", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EI22", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EI30", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EI40", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EI50", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EI60", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "ENS1", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "ENS2", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "ENS3", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "EO11", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EO12", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EO21", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EO22", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EO30", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EO40", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EO50", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EO60", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EO71", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EO72", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EO80", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EP12", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EP1A", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EP1B", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EP1D", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EP1E", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EP1G", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EP1H", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EP20", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EP31", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EP34", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EP35", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "EP36", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "ET11", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "ET12", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "ET20", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "ET30", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "ET40", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "ET50", lcolor(red) lpattern(dash) || ///
    line first_diff_ucc year if bea_asset_code == "RD11", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD12", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD21", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD22", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD23", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD24", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD25", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD31", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD32", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD40", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD50", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD60", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD70", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD80", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD91", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "RD92", lcolor(black) || ///
	line first_diff_ucc year if bea_asset_code == "RDOM", lcolor(black) || ///
    line first_diff_ucc year if bea_asset_code == "SB10", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SB20", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SB31", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SB32", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SB41", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SB42", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SB43", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SB45", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SB46", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SC01", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SC02", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SC03", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SC04", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SI00", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SM01", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SM02", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SN00", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SO01", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SO02", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SO03", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SO04", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SOO1", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SOO2", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SU11", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SU12", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SU20", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SU30", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SU40", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SU50", lcolor(blue) lpattern(dash_dot) || ///
    line first_diff_ucc year if bea_asset_code == "SU60", lcolor(blue) lpattern(dash_dot) ///
    legend(label(1 "Intellectual Property Products") label(6 "Equipment") label(90 "Structures") pos(6) rows(1) order(1 6 90)) ///
	xline(2017.5) xlabel(1987(3)2023) ytitle("Year-to-Year Change in User Cost of Capital") xtitle("") yline(0)

graph export "$output\ucc_yrchg.png", replace
graph export "$output\fig5.eps", replace


//////////////
// FIGURE 1 //
//////////////

import excel "C:\Users\jspada\Dropbox\tcja\tcja_project\tcja\data\downloads\fig1.xlsx", sheet("Sheet1") firstrow clear

keep if Year >= 1962
drop RevenuesGDP_fred

//replace RevenuesGDP = RevenuesGDP * 100

twoway (line TopMarginalCorporateTaxRate Year, yaxis(1) lcolor(blue)) ///
(line RevenuesGDP Year, yaxis(2) lpattern(dash) lcolor(red)), ///
xlabel(1962(4)2024, angle(20) labsize(small)) ///
xtitle("") ///
xline(2017.5, lpattern(dash) lcolor(black)) ///
ylabel(20(5)55, axis(1)) ///
ylabel(1(0.25)4, format(%3.2f) axis(2)) ///
ytitle("Revenues/GDP (%)", axis(2)) ///
legend(order(1 "Top U.S. Marginal Corporate Tax Rate" 2 "U.S. Federal Corporate Tax Revenue as a Fraction of GDP") pos(6) rows(2))

graph export "$output\corptax_corprevenues.png", replace
graph export "$output\fig1.eps", replace


//////////////
// FIGURE 8 //
//////////////

import excel "C:\Users\jspada\Dropbox\tcja\tcja_project\tcja\data\downloads\jon_figures.xlsx", sheet("firm_inv_rates") firstrow clear

rename B _2018
rename C _2017
rename D _2016

rename A category
reshape long _, i(category) j(year)
rename _ value
destring year, replace

gen byte cat = .
replace cat = 1 if category == "< 5%"
replace cat = 2 if category == "5% - 10%"
replace cat = 3 if category == "10% - 15%"
replace cat = 4 if category == "15% - 20%"
replace cat = 5 if category == "20% - 25%"
replace cat = 6 if category == "25% - 30%"
replace cat = 7 if category == "30% - 35%"
replace cat = 8 if category == "35% - 40%"
replace cat = 9 if category == "> 40%"

label define catlbl ///
    1 "< 5%" 2 "5% - 10%" 3 "10% - 15%" 4 "15% - 20%" ///
    5 "20% - 25%" 6 "25% - 30%" 7 "30% - 35%" 8 "35% - 40%" 9 "> 40%"
label values cat catlbl

graph bar (mean) value, over(year) over(cat, gap(100) label(angle(0) labsize(small))) ///
    asyvars bargap(20) ///
	bar(1, color(gray) lcolor(black) lwidth(medium)) ///
    bar(2, color(red) lcolor(black) lwidth(medium) lpattern(dash)) ///
    bar(3, color(blue)) ///
    legend(rows(1) pos(6) order(1 "2016" 2 "2017" 3 "2018")) ///
    ytitle("Fraction of CRSP/Compustat Firms") ///
	b1title("Investment Rate") ///
	ylabel(0 "0%" 0.05 "5%" 0.1 "10%" 0.15 "15%" 0.2 "20%" 0.25 "25%" 0.3 "30%" 0.35 "35%" 0.4 "40%")

graph export "$output\firm_inv_rates.png", replace
graph export "$output\fig8.eps", replace


//////////////
// FIGURE 2 //
//////////////

import excel "C:\Users\jspada\Dropbox\tcja\tcja_project\tcja\data\downloads\capital_deepening.xlsx", firstrow clear

gen year = year(DATE)
keep year G

twoway (line G year, lcolor(blue)), ///
xlabel(1948(4)2024, angle(20) labsize(small)) ///
xtitle("") ///
xline(2017.5, lpattern(dash) lcolor(black)) ///
ylabel(-.06(0.02)0.08, format(%3.2f)) ///
ylabel(-0.06 "-6%" -0.04 "-4%" -0.02 "-2%" 0 "0%" 0.02 "2%" 0.04 "4%" 0.06 "6%" 0.08 "8%") ///
ytitle("Annual % Change in Capital (K) per Worker (L)") ///
legend(off) ///
xline(2017.5) yline(0)

graph export "$output\capital_deepening.png", replace
graph export "$output\fig2.eps", replace


//////////////
// FIGURE 9 //
//////////////

import excel "C:\Users\jspada\Dropbox\tcja\tcja_project\tcja\data\downloads\corptax_predictit.xlsx", firstrow clear

rename DataSourcePredictIthttpsw date
drop if date == "Date"
destring B, replace
destring C, replace
replace date = strtrim(date)
generate numeric_date = date(date, "MDY")
format numeric_date %td

twoway (line B numeric_date, lcolor(blue)) ///
(line C numeric_date, lpattern(dash) lcolor(red)), ///
xlabel(21086(5)21175, labsize(small) angle(30)) ///
ylabel(0(.1)1, format(%3.2f)) ///
ytitle("Prediction Market Price") ///
xtitle("") ///
ylabel(0 "$0.00" 0.1 "$0.10" 0.2 "$0.20" 0.3 "$0.30" 0.4 "$0.40" 0.5 "$0.50" 0.6 "$0.60" 0.7 "$0.70" 0.8 "$0.80" 0.9 "$0.90" 1 "$1.00") ///
legend(order(1 "Corporate tax cut by end of 2017?" 2 "Corporate tax cut by 3/31/18?") pos(6) rows(2))

graph export "$output\predictit.png", replace
graph export "$output\fig9.eps", replace


//////////////
// FIGURE 3 //
//////////////

import excel "C:\Users\jspada\Dropbox\tcja\tcja_project\tcja\data\downloads\agg_i_over_k.xlsx", cellrange(A8:DF111) clear

keep B K-DD
replace B = "year" if K == "1926"
drop if B == ""
keep if B == "Equipment" | B == "Structures" | B == "    Private fixed assets" | B == "Intellectual property products" | B == "year"
replace B = strtrim(B)
destring K-DD, replace

rename B category

quietly ds category, not
local cols `r(varlist)'

foreach v of local cols {
    local yr = `=string(`v'[1], "%9.0g")'
    rename `v' _`yr'
}

drop in 1

reshape long _, i(category) j(year)
rename _ value

destring year, ignore("_") replace
order category year value
sort category year



twoway (line value year if category == "Equipment", lcolor(red) lpattern(dash)) ///
(line value year if category == "Structures", lcolor(blue) lpattern(dash_dot)) ///
(line value year if category == "Intellectual property products", lcolor(black) lpattern(longdash)) ///
(line value year if category == "Private fixed assets", lcolor(orange)), ///
xlabel(1926(4)2023, labsize(small) angle(30)) ///
ylabel(0(.05).35, format(%3.2f)) ///
ytitle("Investment Rate (I/K)") ///
xtitle("") ///
ylabel(0 "0%" 0.05 "5%" 0.1 "10%" 0.15 "15%" 0.2 "20%" 0.25 "25%" 0.3 "30%" 0.35 "35%") ///
legend(order(4 "Total" 3 "Intellectual Property" 1 "Equipment" 2 "Structures") pos(6) rows(2)) ///
xline(2017.5)

graph export "$output\agg_i_over_k.png", replace
graph export "$output\fig3.eps", replace