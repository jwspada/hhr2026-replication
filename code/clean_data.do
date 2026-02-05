// Filename: clean_data.do
// Author: Joseph Spada
// Description: builds final asset-level panel with user cost, tax, and investment metrics

****** import and prepare investment data (cleaned in python) ******

import excel "${data}\det_i", firstrow clear

foreach v of varlist D-BW {
   local x : variable label `v'
   rename `v' investment`=strtrim("`x'")'
}

drop A
drop if AssetCodes == ""

reshape long investment, i(AssetCodes NIPAAssetTypes) j(year)

rename AssetCodes bea_asset_code
rename NIPAAssetTypes asset_name

replace bea_asset_code = strtrim(bea_asset_code)

save "${data}\investment.dta", replace


****** import and prepare capital stock data (cleaned in python) ******

import excel "${data}\det_k", firstrow clear

foreach v of varlist D-BW {
   local x : variable label `v'
   rename `v' capital`=strtrim("`x'")'
}

drop A
drop if AssetCodes == ""

reshape long capital, i(AssetCodes NIPAAssetTypes) j(year)

rename AssetCodes bea_asset_code
rename NIPAAssetTypes asset_name

replace bea_asset_code = strtrim(bea_asset_code)

save "${data}\capital.dta", replace


****** import and prepare i/k data (cleaned in python) ******

import excel "${data}\det_i_over_k", firstrow clear

foreach v of varlist D-BW {
   local x : variable label `v'
   rename `v' i_over_k`=strtrim("`x'")'
}

drop A
drop if AssetCodes == ""

reshape long i_over_k, i(AssetCodes NIPAAssetTypes) j(year)

rename AssetCodes bea_asset_code
rename NIPAAssetTypes asset_name

replace bea_asset_code = strtrim(bea_asset_code)

save "${data}\i_over_k.dta", replace

****** import and clean inflation data ******

import excel "${data}\downloads\inflation", sheet("Sheet1") firstrow clear

save "${data}\pi.dta", replace

****** import and clean individual tax rate data ******

import excel "${data}\downloads\ind_tax_rate", sheet("Annual") firstrow clear
rename IITTRHB tau_Ind
replace tau_Ind = tau_Ind / 100
gen year = year(observation_date)
drop observation_date

save "${data}\tau_Ind.dta", replace

****** import and clean corporate tax rate data ******

import excel "${data}\downloads\corp_tax_rate", sheet("Sheet2") firstrow clear
rename tau tau_C

merge 1:1 year using "${data}\tau_Ind.dta"
drop _merge

replace tau_Ind = .37 if missing(tau_Ind) & year < 2026

save "${data}\tau.dta", replace

****** import and clean ucc tau only qbi data ******

qui{
	forvalues year = 1987/2023 {
		import delimited "${data}\ucc\qbi_tauonly\asset_ucc_qbi_`year'_tauonly", clear
		keep if tax_treat == "non-corporate"
		keeporder asset_name bea_asset_code tax_treat rho_mix metr_mix ucc_mix z_mix
		replace tax_treat = "non-corporate qbi"
		rename rho_mix rho_mix_tauonly
		rename metr_mix metr_mix_tauonly
		rename ucc_mix ucc_mix_tauonly
		rename z_mix z_mix_tauonly
		gen year = `year'
		order year, first
		save "${data}\ucc\asset_ucc_qbi_`year'_tauonly.dta", replace
	}

	use "${data}\ucc\asset_ucc_qbi_1987_tauonly", clear
	forvalues year = 1988/2023{
		append using "${data}\ucc\asset_ucc_qbi_`year'_tauonly.dta"
	}
	
	drop if bea_asset_code == ""
	sort bea_asset_code year
}

save "${data}\ucc\asset_ucc_qbi_tauonly.dta", replace

****** import and clean ucc tau only data ******

qui{
	forvalues year = 1987/2023 {
		import delimited "${data}\ucc\tauonly\asset_ucc_`year'_tauonly", clear
		keeporder asset_name bea_asset_code tax_treat rho_mix metr_mix ucc_mix z_mix
		rename rho_mix rho_mix_tauonly
		rename metr_mix metr_mix_tauonly
		rename ucc_mix ucc_mix_tauonly
		rename z_mix z_mix_tauonly
		gen year = `year'
		order year, first
		save "${data}\ucc\asset_ucc_`year'_tauonly.dta", replace
	}

	use "${data}\ucc\asset_ucc_1987_tauonly", clear
	forvalues year = 1988/2023{
		append using "${data}\ucc\asset_ucc_`year'_tauonly.dta"
	}
	
	drop if bea_asset_code == ""
	sort bea_asset_code year
}

append using "${data}\ucc\asset_ucc_qbi_tauonly.dta"
sort bea_asset_code year tax_treat

save "${data}\ucc\asset_ucc_tauonly.dta", replace

****** import and clean ucc bonus only data ******

qui{
	forvalues year = 1987/2023 {
		import delimited "${data}\ucc\bonusonly\asset_ucc_`year'_bonusonly", clear
		keeporder asset_name bea_asset_code tax_treat rho_mix metr_mix ucc_mix z_mix
		rename rho_mix rho_mix_bonusonly
		rename metr_mix metr_mix_bonusonly
		rename ucc_mix ucc_mix_bonusonly
		rename z_mix z_mix_bonusonly
		gen year = `year'
		order year, first
		save "${data}\ucc\asset_ucc_`year'_bonusonly.dta", replace
	}

	use "${data}\ucc\asset_ucc_1987_bonusonly", clear
	forvalues year = 1988/2023{
		append using "${data}\ucc\asset_ucc_`year'_bonusonly.dta"
	}
	
	drop if bea_asset_code == ""
	sort bea_asset_code year
}

save "${data}\ucc\asset_ucc_bonusonly.dta", replace

****** import and clean ucc qbi data ******

qui{
	forvalues year = 1987/2023 {
		import delimited "${data}\ucc\qbi\asset_ucc_qbi_`year'", clear
		keep if tax_treat == "non-corporate"
		keeporder asset_name bea_asset_code major_asset_group assets tax_treat y delta rho_mix metr_mix ucc_mix tax_wedge_mix z_mix
		replace tax_treat = "non-corporate qbi"
		gen year = `year'
		order year, first
		save "${data}\ucc\asset_ucc_qbi_`year'.dta", replace
	}

	use "${data}\ucc\asset_ucc_qbi_1987", clear
	forvalues year = 1988/2023{
		append using "${data}\ucc\asset_ucc_qbi_`year'.dta"
	}
	
	drop if bea_asset_code == ""
	sort bea_asset_code tax_treat year
}

replace bea_asset_code = strtrim(bea_asset_code)
format assets %13.0f

save "${data}\ucc\asset_ucc_qbi.dta", replace

****** import and clean ucc data ******

qui{
	forvalues year = 1987/2023 {
		import delimited "${data}\ucc\main\asset_ucc_`year'", clear
		keeporder asset_name bea_asset_code major_asset_group assets tax_treat y delta rho_mix metr_mix ucc_mix tax_wedge_mix z_mix
		gen year = `year'
		order year, first
		save "${data}\ucc\asset_ucc_`year'.dta", replace
	}

	use "${data}\ucc\asset_ucc_1987", clear
	forvalues year = 1988/2023{
		append using "${data}\ucc\asset_ucc_`year'.dta"
	}
	
	drop if bea_asset_code == ""
	sort bea_asset_code tax_treat year
}

replace bea_asset_code = strtrim(bea_asset_code)
format assets %13.0f

save "${data}\ucc\asset_ucc.dta", replace
export excel "${data}\ucc\asset_ucc.xlsx", replace firstrow(variables)

use "${data}\ucc\asset_ucc.dta", clear

// fixing ENS1 and ENS2 which are mislabeled as equipment in the CCC, they should be IPP
replace major_asset_group = "Intellectual Property" if bea_asset_code == "ENS1" | bea_asset_code == "ENS2"

// append qbi ucc data
append using "${data}\ucc\asset_ucc_qbi.dta"
sort bea_asset_code tax_treat year

// merge in ucc tau only
merge 1:1 bea_asset_code tax_treat year using "${data}\ucc\asset_ucc_tauonly.dta"
drop _merge

// merge in ucc bonus only
merge 1:1 bea_asset_code tax_treat year using "${data}\ucc\asset_ucc_bonusonly.dta"
drop _merge

// merge in inflation data
merge m:1 year using "${data}\pi.dta"
drop if _merge < 3
drop _merge

// merge in tax rate data
merge m:1 year using "${data}\tau.dta"
drop if _merge < 3
drop _merge

// placeholder for investment tax credit
gen k = 0

// merge in yearly investment data by asset
merge m:1 year bea_asset_code using "${data}\investment.dta"
drop _merge

// merge in yearly capital data by asset
merge m:1 year bea_asset_code using "${data}\capital.dta"
drop _merge

// dropping fixed assets with no investment during the period of study
drop if missing(rho_mix) | missing(investment)
bysort bea_asset_code: egen max_inv = max(investment)
drop if max_inv == 0
drop max_inv

// creating a "COMP" asset by combining 4 computer asset types with high volatility
expand 2 if bea_asset_code == "RD21" | bea_asset_code == "RD22" | bea_asset_code == "RD24" | bea_asset_code == "RD25", gen(COMP)
replace bea_asset_code = "COMP" if COMP

// calculate the total capital stock by bea asset type, want to find the sum of capital for the new COMP asset
bysort bea_asset_code tax_treat year: egen total_capital = sum(capital)

// weight the variables by the proportion of capital coming from that asset, this only affects COMP
foreach var in assets delta rho_mix metr_mix tax_wedge_mix z_mix rho_mix_tauonly metr_mix_tauonly z_mix_tauonly rho_mix_bonusonly metr_mix_bonusonly z_mix_bonusonly {
	replace `var' = (capital / total_capital) * `var' if COMP
} 

// summing the weighted variable components together, this only affects COMP
collapse (firstnm) asset_name major_asset_group y (sum) assets delta (firstnm) pi tau_C tau_Ind k (sum) z_mix rho_mix metr_mix ucc_mix tax_wedge_mix rho_mix_tauonly ucc_mix_tauonly metr_mix_tauonly z_mix_tauonly rho_mix_bonusonly ucc_mix_bonusonly metr_mix_bonusonly z_mix_bonusonly investment capital, by(bea_asset_code tax_treat year)

replace asset_name = "Computer asset index" if bea_asset_code == "COMP"

// taking the mean of the deltas for COMP
bysort bea_asset_code tax_treat: ereplace delta = mean(delta)

// recalculating the UCCs for comp
replace ucc_mix = rho_mix + delta if bea_asset_code == "COMP"
replace ucc_mix_tauonly = rho_mix_tauonly + delta if bea_asset_code == "COMP"
replace ucc_mix_bonusonly = rho_mix_bonusonly + delta if bea_asset_code == "COMP"

// calculate yearly investment ratio by asset
bysort bea_asset_code tax_treat (year): gen i_over_k = investment[_n] / capital[_n - 1]
replace i_over_k = 0 if missing(i_over_k) & investment == 0

// calculate non-corp rho with qbi post 2018
// portion of rho coming from qbi ucc
gen non_corp_qbi_shar = .24 * rho_mix if tax_treat == "non-corporate qbi"
// portion of rho coming from standard PSE ucc
replace non_corp_qbi_shar = .76 * rho_mix if tax_treat == "non-corporate"
// summing the portions together for non-corp and post TCJA when QBI came into effect
bysort bea_asset_code year: egen weighted_noncorp_rho = sum(non_corp_qbi_shar) if tax_treat != "corporate" & year > 2017
replace rho_mix = weighted_noncorp_rho if tax_treat == "non-corporate" & !missing(weighted_noncorp_rho)
drop non_corp_qbi_shar weighted_noncorp_rho

// calculate non-corp ucc with qbi post 2018
// portion of ucc coming from qbi ucc
gen non_corp_qbi_shar = .24 * ucc_mix if tax_treat == "non-corporate qbi"
// portion of ucc coming from standard PSE ucc
replace non_corp_qbi_shar = .76 * ucc_mix if tax_treat == "non-corporate"
// summing the portions together for non-corp and post TCJA when QBI came into effect
bysort bea_asset_code year: egen weighted_noncorp_ucc = sum(non_corp_qbi_shar) if tax_treat != "corporate" & year > 2017
replace ucc_mix = weighted_noncorp_ucc if tax_treat == "non-corporate" & !missing(weighted_noncorp_ucc)
drop non_corp_qbi_shar weighted_noncorp_ucc

// calculate non-corp metr with qbi post 2018
gen non_corp_qbi_shar = .24 * metr_mix if tax_treat == "non-corporate qbi"
replace non_corp_qbi_shar = .76 * metr_mix if tax_treat == "non-corporate"
bysort bea_asset_code year: egen weighted_noncorp_metr = sum(non_corp_qbi_shar) if tax_treat != "corporate" & year > 2017
replace metr_mix = weighted_noncorp_metr if tax_treat == "non-corporate" & !missing(weighted_noncorp_metr)
drop non_corp_qbi_shar weighted_noncorp_metr

// calculate non-corp ucc_tauonly with qbi post 2018
gen non_corp_qbi_shar = .24 * ucc_mix_tauonly if tax_treat == "non-corporate qbi"
replace non_corp_qbi_shar = .76 * ucc_mix_tauonly if tax_treat == "non-corporate"
bysort bea_asset_code year: egen weighted_noncorp_ucc_mix_tauonly = sum(non_corp_qbi_shar) if tax_treat != "corporate" & year > 2017
replace ucc_mix_tauonly = weighted_noncorp_ucc_mix_tauonly if tax_treat == "non-corporate" & !missing(weighted_noncorp_ucc_mix_tauonly)
drop non_corp_qbi_shar weighted_noncorp_ucc_mix_tauonly

drop if tax_treat == "non-corporate qbi"

// calculate asset share between PSEs and C-corps
bysort bea_asset_code year: egen total_assets = sum(assets)
gen asset_share = assets / total_assets
gen rho_share = rho_mix * asset_share
gen ucc_share = ucc_mix * asset_share
gen metr_share = metr_mix * asset_share
gen ucc_bonusonly_share = ucc_mix_bonusonly * asset_share
gen ucc_tauonly_share = ucc_mix_tauonly * asset_share

// calculate a weighted rho, ucc, and metr based on the asset share
bysort bea_asset_code year: egen weighted_rho = sum(rho_share)
bysort bea_asset_code year: egen weighted_ucc = sum(ucc_share)
bysort bea_asset_code year: egen weighted_metr = sum(metr_share)
bysort bea_asset_code year: egen weighted_ucc_bonusonly = sum(ucc_bonusonly_share)
bysort bea_asset_code year: egen weighted_ucc_tauonly = sum(ucc_tauonly_share)
drop if tax_treat == "non-corporate"
drop tax_treat ucc_share metr_share rho_share ucc_bonusonly_share ucc_tauonly_share

// create variables for yearly values of variables of interest
forvalues year = 2016(1)2023{
	bysort bea_asset_code (year): gen ik`year' = i_over_k if year == `year'
	bysort bea_asset_code (year): ereplace ik`year' = max(ik`year')
	
	bysort bea_asset_code (year): gen inv`year' = investment if year == `year'
	bysort bea_asset_code (year): ereplace inv`year' = max(inv`year')
		
	bysort bea_asset_code (year): gen rho`year' = rho_mix if year == `year'
	bysort bea_asset_code (year): ereplace rho`year' = max(rho`year')
	
	bysort bea_asset_code (year): gen metr`year' = metr_mix if year == `year'
	bysort bea_asset_code (year): ereplace metr`year' = max(metr`year')
	
	bysort bea_asset_code (year): gen ucc`year' = ucc_mix if year == `year'
	bysort bea_asset_code (year): ereplace ucc`year' = max(ucc`year')
	
	bysort bea_asset_code (year): gen weighted_ucc`year' = weighted_ucc if year == `year'
	bysort bea_asset_code (year): ereplace weighted_ucc`year' = max(weighted_ucc`year')
	
	bysort bea_asset_code (year): gen weighted_metr`year' = weighted_metr if year == `year'
	bysort bea_asset_code (year): ereplace weighted_metr`year' = max(weighted_metr`year')
		
	bysort bea_asset_code (year): gen weighted_ucc_tauonly`year' = weighted_ucc_tauonly if year == `year'
	bysort bea_asset_code (year): ereplace weighted_ucc_tauonly`year' = max(weighted_ucc_tauonly`year')
	
	bysort bea_asset_code (year): gen weighted_ucc_bonusonly`year' = weighted_ucc_bonusonly if year == `year'
	bysort bea_asset_code (year): ereplace weighted_ucc_bonusonly`year' = max(weighted_ucc_bonusonly`year')
}

// calculate changes from 2016 to each annual time horizon for variables of interest
forvalues year = 2017(1)2023{
	// change in investment rate
	gen ikchange`year'minus2016 = ik`year' - ik2016
	// change in rho
	gen rhochange`year'minus2016 = rho`year' - rho2016
	// change in metr
	gen metrchange`year'minus2016 = metr`year' - metr2016
	// change in ucc
	gen uccchange`year'minus2016 = ucc`year' - ucc2016
	// change in weighted ucc
	gen wgtd_uccchange`year'minus2016 = weighted_ucc`year' - weighted_ucc2016
	// change in weighted metr
	gen wgtd_metrchange`year'minus2016 = weighted_metr`year' - weighted_metr2016
	// change in weighted ucc (tau only)
	gen wucctauonlychange`year'minus2016 = weighted_ucc_tauonly`year' - weighted_ucc_tauonly2016
	// change in weighted ucc (bonus only)
	gen wuccbonusonlychange`year'minus2016 = weighted_ucc_bonusonly`year' - weighted_ucc_bonusonly2016
}

// drop intermediate variables
drop ik20* rho20* metr20* inv20*
drop ucc20* weighted_ucc_tauonly20* weighted_ucc_bonusonly20* weighted_ucc20* weighted_metr20*

order investment capital i_over_k, after(delta)

drop if missing(rho_mix)

// create an asset_id variable
egen asset_id = group(bea_asset_code)

// trimming and winsorizing at 1, 2.5, 5, and 10%
foreach var in ikchange2017minus2016 ikchange2018minus2016 ikchange2019minus2016 ikchange2020minus2016 ikchange2021minus2016 ikchange2022minus2016 ikchange2023minus2016 {
	// 1%
	winsor2 `var' if bea_asset_code != "COMP", cuts(1 99) suffix(_w1) by(year)
	winsor2 `var' if bea_asset_code != "RD21" & bea_asset_code != "RD22" & bea_asset_code != "RD24" & bea_asset_code != "RD25", cuts(1 99) suffix(_w1comp) by(year)
	// 2.5%
	winsor2 `var' if bea_asset_code != "COMP", cuts(2.5 97.5) suffix(_w25) by(year)
	winsor2 `var' if bea_asset_code != "RD21" & bea_asset_code != "RD22" & bea_asset_code != "RD24" & bea_asset_code != "RD25", cuts(2.5 97.5) suffix(_w25comp) by(year)
	// 5%
	winsor2 `var' if bea_asset_code != "COMP", cuts(5 95) trim suffix(_t5) by(year)
	winsor2 `var' if bea_asset_code != "RD21" & bea_asset_code != "RD22" & bea_asset_code != "RD24" & bea_asset_code != "RD25", cuts(5 95) trim suffix(_t5comp) by(year)
	winsor2 `var' if bea_asset_code != "COMP", cuts(5 95) suffix(_w5) by(year)
	winsor2 `var' if bea_asset_code != "RD21" & bea_asset_code != "RD22" & bea_asset_code != "RD24" & bea_asset_code != "RD25", cuts(5 95) suffix(_w5comp) by(year)
	// 10%
	winsor2 `var' if bea_asset_code != "COMP", cuts(10 90) suffix(_w10) by(year)
	winsor2 `var' if bea_asset_code != "RD21" & bea_asset_code != "RD22" & bea_asset_code != "RD24" & bea_asset_code != "RD25", cuts(10 90) suffix(_w10comp) by(year)
}

// winsor 5%
winsor2 i_over_k if bea_asset_code != "COMP", cuts(0 95) suffix(_w5)
winsor2 i_over_k if bea_asset_code != "RD21" & bea_asset_code != "RD22" & bea_asset_code != "RD24" & bea_asset_code != "RD25", cuts(0 95) suffix(_w5comp)

// winsor 1%
winsor2 i_over_k if bea_asset_code != "COMP", cuts(0 99) suffix(_w1)
winsor2 i_over_k if bea_asset_code != "RD21" & bea_asset_code != "RD22" & bea_asset_code != "RD24" & bea_asset_code != "RD25", cuts(0 99) suffix(_w1comp)

tab major_asset_group, gen(asset_group)
rename asset_group1 equipment
rename asset_group2 ipp
rename asset_group3 structures

save "${data}\final_data.dta", replace