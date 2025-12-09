# Author: Joseph Spada
# Description: this file calculates yearly investment and capital totals by aggregating across industry
#              totals from the BEA, and runs the cost of capital calculator

### imports ###
import pandas as pd
import numpy as np

### globals ###

# update this with user's path
PATH = "C:/Users/jspada/Dropbox/tcja/tcja_project/hhr2026_replication/"
# specify range of years to calculate totals
START_YEAR = 1952
END_YEAR = 2023

### I/K CALCULATIONS ###

print("Loading in data.")

# load in investment data
raw_i = pd.read_excel(PATH + "data/downloads/detailnonres_inv1.xlsx", 
                      sheet_name = None, 
                      header = 5
)
# load in capital data
raw_k = pd.read_excel(PATH + "data/downloads/detailnonres_stk1.xlsx", 
                      sheet_name = None, 
                      header = 5
)

# drop unneeded sheets
drop_sheets = ["readme", "Datasets"]
for sheet in drop_sheets:
    del raw_i[sheet]
    del raw_k[sheet]

# creating a df to hold investment totals by copying the format of the "110C" sheet
det_i = pd.read_excel(PATH + "data/downloads/detailnonres_inv1.xlsx", 
                      sheet_name = "110C", 
                      header = 5
)

# creating a df to hold capital totals by copying the format of the "110C" sheet
det_k = pd.read_excel(PATH + "data/downloads/detailnonres_stk1.xlsx", 
                      sheet_name = "110C", 
                      header = 5
)

# indicate columns to ignore when summing because they contain strings/labels
cols_no_sum = ["Asset Codes", 
               "NIPA Asset Types",]




##### BY INDUSTRY #####



print("Aggregating investment and capital by industry.")

# initialize dataframes to hold investment and capital yearly totals by industry
industry_det_i = pd.DataFrame(columns=["Industry Code"] + list(range(START_YEAR, END_YEAR + 1)))
industry_det_k = pd.DataFrame(columns=["Industry Code"] + list(range(START_YEAR, END_YEAR + 1)))

# calculate yearly investment totals by industry
for industry, df in raw_i.items():
    # initialize a dictionary to hold yearly investment sums
    curr_ind = dict()
    curr_ind["Industry Code"] = industry
    for year in range(START_YEAR, END_YEAR + 1):
        equipment_tot = df.loc[df["Asset Codes"] == "EQUIPMENT", str(year)].values[0]
        structures_tot = df.loc[df["Asset Codes"] == "STRUCTURES", str(year)].values[0]
        ipp_tot = df.loc[df["Asset Codes"] == "IPP", str(year)].values[0]
        curr_ind[year] = equipment_tot + structures_tot + ipp_tot
    industry_det_i = industry_det_i._append(curr_ind, ignore_index = True)


# calculate yearly capital totals by industry
for industry, df in raw_k.items():
    # initialize a dictionary to hold yearly capital sums
    curr_ind = dict()
    curr_ind["Industry Code"] = industry
    for year in range(START_YEAR, END_YEAR + 1):
        equipment_tot = df.loc[df["Asset Codes"] == "EQUIPMENT", str(year)].values[0]
        structures_tot = df.loc[df["Asset Codes"] == "STRUCTURES", str(year)].values[0]
        ipp_tot = df.loc[df["Asset Codes"] == "IPP", str(year)].values[0]
        curr_ind[year] = equipment_tot + structures_tot + ipp_tot
    industry_det_k = industry_det_k._append(curr_ind, ignore_index = True)

# creating a new df for holding industry i/k values
industry_i_over_k = pd.DataFrame(columns=["Industry Code"] + list(range(START_YEAR, END_YEAR + 1)))

industry_det_i = industry_det_i.set_index("Industry Code")
industry_det_k = industry_det_k.set_index("Industry Code")

# shifting the k values one year to the right 
# so each years i value is divided by the previous year's k value
industry_shifted_k = industry_det_k.shift(axis = 1)

# create a mask to avoid division by 0
industry_non_zero_k = industry_shifted_k != 0

# calculate i/k where prior year k is not 0, set i/k to 0 if prior year k is 0
industry_i_over_k = industry_det_i / industry_shifted_k.where(industry_non_zero_k, 0)

# fill in with NaN where prior year k is missing
industry_i_over_k = industry_i_over_k.where(industry_non_zero_k, np.nan)

# dropping empty 1947 column
industry_i_over_k = industry_i_over_k.drop(START_YEAR, axis = 1)




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
det_i.to_excel(PATH + "data/det_i.xlsx")
det_k.to_excel(PATH + "data/det_k.xlsx")

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

det_i_over_k.to_excel(PATH + "data/det_i_over_k.xlsx")









