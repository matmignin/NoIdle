#!/usr/bin/env python3

import pandas as pd

workbook1 = "ALLSPECs"
sheet1 = "FG"
column1 = "SP_TestPlan"
column2 = "Analyte"
saveAs = "DROPDUPSPEC"


df = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet1)
df.drop_duplicates([column1, column2], keep='first', inplace=True)

df.to_excel(saveAs + ".xlsx")

