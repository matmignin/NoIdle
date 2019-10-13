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


merged_dfO = df1.merge(df2, how ='outer', left_on =match1, right_on=match2, indicator=True)
merged_dfI = df1.merge(df2, how = "inner", left_on =match1, right_on=match2, indicator=True)
merged_dfR = df1.merge(df2, how ='right', left_on =match1, right_on=match2, indicator=True)
merged_dfL = df1.merge(df2, how ='left', left_on =match1, right_on=match2, indicator=True)

merged_dfO.to_excel("Results/outer" + ".xlsx", sheet_name=sheet1 + sheet2)
merged_dfI.to_excel("Results/inner.xlsx", sheet_name="inner")
merged_dfR.to_excel("Results/right.xlsx", sheet_name=sheet1 + sheet2)
merged_dfL.to_excel("Results/left.xlsx", sheet_name=sheet1 + sheet2)
