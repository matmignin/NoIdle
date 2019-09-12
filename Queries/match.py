#!/usr/bin/env python3

import pandas as pd
# import xlrd

df = pd.read_excel('AllandEverything.xlsx')
df.drop_duplicates(['MATCODE'], keep='first', inplace=True)

df.to_excel("AllandEverything3.xlsx")
