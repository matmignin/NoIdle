#!/usr/bin/env python3

import pandas as pd

workbook1 = "Master"
sheet1 = "Equipment"
match1 = "EQMETHOD.CONVERT"

# workbook2 = workbook1
sheet2 = "TMdes"
match2 = "TMMETHOD"

mode = "outer"

# saveAs = workbook1 +"

df1 = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet1)
df2 = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet2)


merged_df = df1.merge(df2, how = mode, left_on =match1, right_on=match2, indicator=True)

merged_df.to_excel(sheet2 + "AND"  + sheet1 + ".xlsx", sheet_name=sheet1 + sheet2)
