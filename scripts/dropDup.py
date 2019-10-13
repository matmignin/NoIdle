#!/usr/bin/env python3

import pandas as pd

#workbook1 = "BulkTests"
#sheet1 = "Bulkseparated"
#column1 = "TM"
#column2 = "PRODUCT_SPEC.COMPONENT"
#saveAs = "DropDuplicates"

workbook1 = "ALLSPECs"
sheet1 = "RM"
column1 = "METHOD"
column2 = "PRODUCT_SPEC.COMPONENT"
# saveAs = "rm_componentTests"

df = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet1)
df.drop_duplicates([column1], [columb2], keep='first', inplace=True)

df.to_excel("dupDrop" + sheet1 + ".xlsx")

