#!/usr/bin/env python3
# coding: utf-8

workbook1 = "ProductSpecs"
sheet1 = "bulkTests"
columnToSplit = "TM"
splitChar = "/"

Column1 = "TM"
column2 = "PRODUCT_SPEC.COMPONENT"

saveAs = "separatedAndDrop"

import pandas as pd
products = pd.read_excel(workbook1 + ".xlsx", sheet_name=sheet1, index_col=None, header=0)

products1 = products.drop(columnToSplit, axis=1).join(products[columnToSplit].str.split(splitChar, expand=True).stack().reset_index(level=1, drop=True).rename(columnToSplit)).reset_index(drop=True)

products1.drop_duplicates([column1, column2], keep='first', inplace=True)



products1.to_excel(saveAs + ".xlsx")


