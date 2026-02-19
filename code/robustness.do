// Filename: robustness.do
// Author: Joseph Spada
// Descripion: runs robustness regressions

clear all

// import asset data
use "${data}\final_data.dta", clear

global MIN_YEAR = 2018
global MAX_YEAR = 2023

// appendix table 3 panel a
// no winsorization
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 ucc change"
	reg ikchange`year'minus2016 wgtd_uccchange`year'minus2016 if year == `year' & bea_asset_code != "COMP", robust
}
// 2.5% winsorization
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 ucc change"
	reg ikchange`year'minus2016_w25 wgtd_uccchange`year'minus2016 if year == `year', robust
}
// 5% winsorization (main results)
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 ucc change"
	reg ikchange`year'minus2016_w5 wgtd_uccchange`year'minus2016 if year == `year', robust
}
// 10% winsorization
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 ucc change"
	reg ikchange`year'minus2016_w10 wgtd_uccchange`year'minus2016 if year == `year', robust
}

// appendix table 3 panel b
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 metr change"
	reg ikchange`year'minus2016 wgtd_metrchange`year'minus2016 if year == `year', robust
}
// 2.5% winsorization
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 metr change"
	reg ikchange`year'minus2016_w25 wgtd_metrchange`year'minus2016 if year == `year', robust
}
// 5% winsorization (main results)
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 metr change"
	reg ikchange`year'minus2016_w5 wgtd_metrchange`year'minus2016 if year == `year', robust
}
// 10% winsorization
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 metr change"
	reg ikchange`year'minus2016_w10 wgtd_metrchange`year'minus2016 if year == `year', robust
}





// appendix table 4 panel a
// no winsorization
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 ucc change"
	reg ikchange`year'minus2016 wgtd_uccchange`year'minus2016 if year == `year' & bea_asset_code != "RD21" & bea_asset_code != "RD22" & bea_asset_code != "RD24" & bea_asset_code != "RD25", robust
}
// 2.5% winsorization
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 ucc change"
	reg ikchange`year'minus2016_w25comp wgtd_uccchange`year'minus2016 if year == `year', robust
}
// 5% winsorization (main results)
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 ucc change"
	reg ikchange`year'minus2016_w5comp wgtd_uccchange`year'minus2016 if year == `year', robust
}
// 10% winsorization
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 ucc change"
	reg ikchange`year'minus2016_w10comp wgtd_uccchange`year'minus2016 if year == `year', robust
}


// appendix table 4 panel b
// no winsorization
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 metr change"
	reg ikchange`year'minus2016 wgtd_metrchange`year'minus2016 if year == `year' & bea_asset_code != "RD21" & bea_asset_code != "RD22" & bea_asset_code != "RD24" & bea_asset_code != "RD25", robust
}
// 2.5% winsorization
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 metr change"
	reg ikchange`year'minus2016_w25comp wgtd_metrchange`year'minus2016 if year == `year', robust
}
// 5% winsorization (main results)
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 metr change"
	reg ikchange`year'minus2016_w5comp wgtd_metrchange`year'minus2016 if year == `year', robust
}
// 10% winsorization
forvalues year = $MIN_YEAR(1)$MAX_YEAR{
	di "regress `year' to 2016 investment change on `year' to 2016 metr change"
	reg ikchange`year'minus2016_w10comp wgtd_metrchange`year'minus2016 if year == `year', robust
}



