#!/usr/bin/env python3

import pandas as pd
from openpyxl import *

df1= pd.read_excel('ACTIVE_ITEM_FOR_LIMS_1012019.xlsx', sheet_name='Sheet1')
df2 = pd.read_excel('ProductSpecs.xlsx', sheet_name='PRODUCT')
x = "outer"

writer = pd.ExcelWriter('newActive.xlsx', engine='openpyxl')

merged_df = df2.merge(df1, how = x, left_on ='PRODUCT_CODE', right_on='ITEM_NUMBER', indicator=True)

merged_df.to_excel(writer,  sheet_name='asheet')

writer.save()
