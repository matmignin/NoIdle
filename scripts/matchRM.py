#!/usr/bin/env python3

import pandas as pd

workbook1 = "RMactive"
sheet1 = "RMspec"
match1 = "Mat_MatCode"

# workbook2 = workbook1
sheet2 = "Active"
match2 = "ITEM_NUMBER"

mode = "left"

saveAs = "activeRMspec"

df1 = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet1)
df2 = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet2)


merged_df = df1.merge(df2, how = mode, left_on =match1, right_on=match2, indicator=True)

merged_df.to_excel(saveAs + ".xlsx", sheet_name=saveAs)
