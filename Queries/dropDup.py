#!/usr/bin/env python3

import pandas as pd

df = pd.read_excel('RecentProducts.xlsx', sheet_name='Bulk Liquid')
df.drop_duplicates(['MATCODE'], keep='first', inplace=True)

df.to_excel("RecentProductsNew.xlsx", sheet_name='unique')

