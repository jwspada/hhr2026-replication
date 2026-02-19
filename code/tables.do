// Filename: tables.do
// Author: Joseph Spada
// Descripion: create tables

clear all

// import asset data
use "${data}\final_data.dta", clear

// appendix table 1 - c-corp vs pte asset shares by asset type
keep if year == 2023
rename asset_share ccorp_share
replace ccorp_share = round(ccorp_share, .001)
gen pte_share = round(1 - ccorp_share, .001)
drop if bea_asset_code == "COMP"

// overall mean ccorp share
tabstat ccorp_share, statistics(mean)
// overall mean pte share
tabstat pte_share, statistics(mean)

list bea_asset_code asset_name ccorp_share pte_share

// appendix table 2 - change in ucc by bea asset
// import asset data
use "${data}\final_data.dta", clear
drop if bea_asset_code == "COMP"

replace weighted_ucc = round(weighted_ucc, .0001)
replace wgtd_uccchange2018minus2016 = round(wgtd_uccchange2018minus2016, .0001)
replace wgtd_uccchange2023minus2016 = round(wgtd_uccchange2023minus2016, .0001)


// panel a - major asset class
// equipment
tabstat weighted_ucc if year == 2016 & equipment == 1, statistics(count mean)
tabstat wgtd_uccchange2018minus2016 if year == 2016 & equipment == 1, statistics(mean)
tabstat wgtd_uccchange2023minus2016 if year == 2016 & equipment == 1, statistics(mean)

// structures
tabstat weighted_ucc if year == 2016 & structures == 1, statistics(count mean)
tabstat wgtd_uccchange2018minus2016 if year == 2016 & structures == 1, statistics(mean)
tabstat wgtd_uccchange2023minus2016 if year == 2016 & structures == 1, statistics(mean)

// ipp
tabstat weighted_ucc if year == 2016 & ipp == 1, statistics(count mean)
tabstat wgtd_uccchange2018minus2016 if year == 2016 & ipp == 1, statistics(mean)
tabstat wgtd_uccchange2023minus2016 if year == 2016 & ipp == 1, statistics(mean)

// overall
tabstat weighted_ucc if year == 2016, statistics(count mean)
tabstat wgtd_uccchange2018minus2016 if year == 2016, statistics(mean)
tabstat wgtd_uccchange2023minus2016 if year == 2016, statistics(mean)

// panel b - by bea asset
list bea_asset_code asset_name major_asset_group weighted_ucc wgtd_uccchange2018minus2016 wgtd_uccchange2023minus2016 if year == 2016