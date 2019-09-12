#!/usr/bin/env python3

import pandas as pd

df = pd.read_excel('AllandEverythingFull.xlsx')
df.drop_duplicates(['MATCODE'], keep='first', inplace=True)

df.to_excel("AllandEverythingNew.xlsx", sheet_name='unique')

