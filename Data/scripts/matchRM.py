#!/usr/bin/env python3

import pandas as pd

workbook1 = "Descriptions"
sheet1 = "DES"
match1 = "matcode"

# workbook2 = workbook1
sheet2 = "Des2"
match2 = match1

mode = "left"

saveAs = "DES2"


df1 = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet1)
df2 = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet2)


merged_df = df1.merge(df2, how = mode, left_on =match1, right_on=match2, indicator=True)

merged_df.to_excel(saveAs + ".xlsx", sheet_name=saveAs)
