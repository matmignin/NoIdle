#!/usr/bin/env python3

import pandas as pd

workbook1 = "BLPlans"
sheet1 = "BLlist"
match1 = "Material"

# workbook2 = workbook1
sheet2 = "Count"
match2 = "TestPlan.C2"

mode = "outer"

saveAs = "BLPCount"

df1 = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet1)
df2 = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet2)


merged_df = df1.merge(df2, how = mode, left_on =match1, right_on=match2, indicator=True)

merged_df.to_excel(saveAs + ".xlsx", sheet_name=saveAs)
