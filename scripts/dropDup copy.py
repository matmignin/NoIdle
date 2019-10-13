#!/usr/bin/env python3

import pandas as pd

workbook1 = "BulkTests"
sheet1 = "Bulkseparated"
column1 = "TM"
column2 = "PRODUCT_SPEC.COMPONENT"
saveAs = "DropDuplicates"


df = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet1)
df.drop_duplicates([column1, column2], keep='first', inplace=True)

df.to_excel(saveAs + ".xlsx")

