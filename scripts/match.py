#!/usr/bin/env python3

import pandas as pd

workbook1 = ""
sheet1 = ""
match1 = ""

workbook2 = ""
sheet2 = ""
match2 = ""

mode = "outer"

saveAs = ""

df1 = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet1)
df2 = pd.read_excel(workbook2 + ".xlsx", sheet_name=sheet2)


merged_df = df1.merge(df2, how = mode, left_on =match1, right_on=match2, indicator=True)

merged_df.to_excel(saveAs + ".xlsx")

