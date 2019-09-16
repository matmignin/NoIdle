#!/usr/bin/env python3

import pandas as pd

df1 = pd.read_excel('BulkLiquid19.xlsx', sheet_name='BL2019')
df2 = pd.read_excel('MATnameTYPE.xlsx', sheet_name='MatNameType')

merged_df = df2.merge(df1, how = 'inner', on = ['MATCODE'])

merged_df.to_excel("RecentBulkProducts.xlsx", sheet_name='BL2019')

