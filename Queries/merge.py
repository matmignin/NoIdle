#!/usr/bin/env python3

import pandas as pd
from click import command, option, argument


@command()
@argument('sheet1')
@argument('sheet2')
@argument('key')
@argument('sheet3')
@option('--i', is_flag=True)
@option('--o', is_flag=True)
@option('--l', is_flag=True)
@option('--r', is_flag=True)
def merge_sheets(sheet1, sheet2, key, sheet3, i, o, l, r):
    df1 = pd.read_excel(sheet1)
    df2 = pd.read_excel(sheet2)
    if i:
        merged_df = df2.merge(df1, how='inner', on = [key], indicator=True)
    elif  o:
        merged_df = df2.merge(df1, how='outer', on = [key], indicator=True)
    elif l:
        merged_df = df2.merge(df1, how='left', on = [key], indicator=True)
    elif r:
        merged_df = df2.merge(df1, how='right', on = [key], indicator=True)
    else:
        merged_df = df2.merge(df1, how='inner', on = [key])

    merged_df.to_excel(sheet3)

if __name__== '__main__':
    merge_sheets()

