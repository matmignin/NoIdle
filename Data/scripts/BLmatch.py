#!/usr/bin/env python3

import pandas as pd

workbook1 = "../uqBL"
sheet1 = "PLANS"
sheet2 = "activeBLspecs"
match = "PLANS"

mode = "left"

saveAs = "BLresultL"

df1 = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet1)
df2 = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet2)


merged_df = df1.merge(df2, how = mode, left_on =match, right_on=match, indicator=True)

merged_df.to_excel("../results/" + saveAs + ".xlsx", sheet_name=saveAs)
