#!/usr/bin/env python3

import pandas as pd

workbook1 = "Master"
sheet1 = "EQTYP"
match1 = "METHOD.CONVERT"

workbook2 = "BulkTests" 
sheet2 = "BulkAnalysis"
match2 = "Name"

mode = "outer"

# saveAs = workbook1 +"

df1 = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet1)
df2 = pd.read_excel(workbook2 + ".xlsx", sheet_name=sheet2)


merged_df = df2.merge(df1, how = mode, left_on =match1, right_on=match2, indicator=True)

merged_df.to_excel(sheet1 + "AND"  + sheet2 + ".xlsx", sheet_name=sheet1 + sheet2)

