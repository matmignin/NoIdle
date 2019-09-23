#!/usr/bin/env python3

import pandas as pd

df1 = pd.read_excel('ACTIVE_ITEM.xlsx')
df2 = pd.read_excel('MATnameTYPE.xlsx', sheet_name='MatNameType')

merged_df = df2.merge(df1, how = 'inner', on = ['MATCODE'])

merged_df.to_excel("All_Products.xlsx", sheet_name='All')

