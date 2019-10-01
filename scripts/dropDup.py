#!/usr/bin/env python3

import pandas as pd

df = pd.read_excel('../Queries/FGspecs.xlsx', sheet_name='noComposit')
df.drop_duplicates(['Mat_MatCode', 'Analyte'], keep='first', inplace=True)

df.to_excel('DuplicatesDeleted.xlsx', sheet_name='unique')

