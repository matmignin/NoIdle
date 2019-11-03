#!/usr/bin/env python3

import pandas as pd
from openpyxl import *

df2 = pd.read_excel('DuplicatesDeleted.xlsx', sheet_name='fgSpec')
df1 = pd.read_excel('DuplicatesDeleted.xlsx', sheet_name='FG')
x = "outer"

writer = pd.ExcelWriter('DuplicatesDeleted.xlsx', engine='openpyxl')

merged_df = df2.merge(df1, how = x, left_on ='PRODUCT_CODE', right_on='MatCode', indicator=True)

merged_df.to_excel(writer,  sheet_name='asheet')

writer.save()

