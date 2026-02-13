import sys
from pathlib import Path

# set working directory
REPO_ROOT = Path(__file__).resolve().parents[1]

# specify which ccc model to import
sys.path.insert(0, str(REPO_ROOT / "code" / "ccc_models" / "qbi"))

import ccc
print("Running QBI CCC:", ccc.__file__)

from ccc.data import Assets
from ccc.parameters import Specification, DepreciationParams
from ccc.calculator import Calculator

def calc_ucc(years):
    # create instance of asset class
    assets = Assets()

    # set depreciation parameters
    dp = DepreciationParams()

    for year in years:
        print("Calculating UCC for " + str(year))
        # set default paramaters for current year
        params = Specification(year = year, call_tc=False)
        # calculate ucc by asset for current year
        calc = Calculator(params, dp, assets)
        
        ucc_asset = calc.calc_by_asset()
        # set filename
        filename = (
            REPO_ROOT
            / "data"
            / "ucc"
            / "qbi"
            / f"asset_ucc_qbi_{year}.csv"
        )
        # export to csv
        ucc_asset.to_csv(filename, index = False, header = True)

calc_ucc(range(1987,2024))
