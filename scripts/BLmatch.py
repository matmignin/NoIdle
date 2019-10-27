#!/usr/bin/env python3

import pandas as pd

workbook1 = "xBL_PRODUCT_CODE"
sheet1 = "PLAN"
sheet2 = "ANALYSIS"
match1 = "PRODUCT_CODE"

match2 = match1

mode = "outer"

saveAs = "BLx" + sheet2

df1 = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet1)
df2 = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet2)


merged_df = df1.merge(df2, how = mode, left_on =match1, right_on=match2, indicator=True)

merged_df.to_excel(saveAs + ".xlsx", sheet_name=saveAs)
