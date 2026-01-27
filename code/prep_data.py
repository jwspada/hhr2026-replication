# Author: Joseph Spada
# Description: this file calculates yearly investment and capital totals by aggregating across industry
#              totals from the BEA, and runs the cost of capital calculator

### imports ###
import pandas as pd
import numpy as np
import sys
from pathlib import Path

### globals ###

# set working directory
REPO_ROOT = Path(__file__).resolve().parents[1]
# specify range of years to calculate totals
START_YEAR = 1952
END_YEAR = 2023

### I/K CALCULATIONS ###

print("Loading in data.")

# load in investment data
raw_i = pd.read_excel(REPO_ROOT / "data" / "downloads" / "detailnonres_inv1.xlsx", 
                      sheet_name = None, 
                      header = 5
)
# load in capital data
raw_k = pd.read_excel(REPO_ROOT / "data" / "downloads" / "detailnonres_stk1.xlsx", 
                      sheet_name = None, 
                      header = 5
)

# drop unneeded sheets
drop_sheets = ["readme", "Datasets"]
for sheet in drop_sheets:
    del raw_i[sheet]
    del raw_k[sheet]

# creating a df to hold investment totals by copying the format of the "110C" sheet
det_i = pd.read_excel(REPO_ROOT / "data" / "downloads" / "detailnonres_inv1.xlsx", 
                      sheet_name = "110C", 
                      header = 5
)

# creating a df to hold capital totals by copying the format of the "110C" sheet
det_k = pd.read_excel(REPO_ROOT / "data" / "downloads" / "detailnonres_stk1.xlsx", 
                      sheet_name = "110C", 
                      header = 5
)

# indicate columns to ignore when summing because they contain strings/labels
cols_no_sum = ["Asset Codes", 
               "NIPA Asset Types",]

##### BY ASSET #####


print("Aggregating investment and capital by year.")

# collect the columns/years to drop from the final total calculation
# based on the start and end years above
years_to_drop_i = [col for col in det_i.columns.drop(cols_no_sum) 
                   if not START_YEAR <= int(col) <= END_YEAR]
years_to_drop_k = [col for col in det_k.columns.drop(cols_no_sum) 
                   if not START_YEAR <= int(col) <= END_YEAR]

# drop columns/years from the final total calculation as specified above
det_i.drop(columns = years_to_drop_i, inplace = True)
det_k.drop(columns = years_to_drop_k, inplace = True)

# reset all values to 0 to begin summations
det_i.loc[:, ~det_i.columns.isin(cols_no_sum)] = 0
det_k.loc[:, ~det_k.columns.isin(cols_no_sum)] = 0

# calculate yearly investment totals by asset by summing over each industry sheet
# each sheet corresponds to an industry and each column corresponds to a year
for sheet, df in raw_i.items():
    # ignore string/label columns not needed for summation
    cols_to_drop = [col for col in cols_no_sum if col in df.columns]
    if cols_to_drop:
        df.drop(columns = cols_to_drop, inplace = True)
    # in the current sheet/industry, iterate over columns/years
    for year in df.columns:
        if year in det_i.columns:
            # add current sheet/industry's values to the running total
            det_i[year] += df[year]

# calculate yearly capital totals by asset by summing over each industry
# each sheet corresponds to an industry and each column corresponds to a year
for sheet, df in raw_k.items():
    # ignore string/label columns not needed for summation
    cols_to_drop = [col for col in cols_no_sum if col in df.columns]
    if cols_to_drop:
        df.drop(columns = cols_to_drop, inplace = True)
    # in the current sheet/industry, iterate over columns/years
    for year in df.columns:
        if year in det_k.columns:
            # add current sheet/industry's values to the running total
            det_k[year] += df[year]

# dropping an empty row
det_i = det_i.drop(0)
det_k = det_k.drop(0)

# export detailed i and k sheets to excel
det_i.to_excel(REPO_ROOT / "data" / "det_i.xlsx")
det_k.to_excel(REPO_ROOT / "data" / "det_k.xlsx")

# creating a new df for holding i/k values
det_i_over_k = det_i

# getting all year columns
years = [col for col in det_i_over_k.columns if col != "Asset Codes" and col != "NIPA Asset Types"]

# shifting the k values one year to the right 
# so each years i value is divided by the previous year's k value
shifted_k = det_k[years].shift(axis=1)

# creating a mask to avoid division by zero
non_zero_shifted_k = shifted_k[years] != 0

# calculate i/k where prior year k is not 0, set i/k to 0 if prior year k is 0
det_i_over_k.loc[:, years] = (det_i_over_k.loc[:, years] / 
                              shifted_k.loc[:, years]).where(non_zero_shifted_k, 0)

# fill in with NaN where prior year k is missing
det_i_over_k.loc[:, years] = det_i_over_k.loc[:, years].where(non_zero_shifted_k, np.nan)

det_i_over_k.to_excel(REPO_ROOT / "data" / "det_i_over_k.xlsx")









