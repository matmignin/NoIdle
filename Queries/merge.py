#!/usr/bin/env python3

import pandas as pd
from click import command, option, argument



@command()
@argument('sheet1')
@argument('sheet2')
@argument('key')
@argument('sheet3')
@option('--inner', is_flag=True)
def merge_sheets(sheet1, sheet2, key, sheet3, inner):
    df1 = pd.read_excel(sheet1)
    df2 = pd.read_excel(sheet2)
    if inner:
        merged_df = df2.merge(df1, how = 'inner', on = [key], indicator=True)
    else:
        merged_df = df2.merge(df1, how = 'outer', on = [key], indicator=True)

    merged_df.to_excel(sheet3)

if __name__== '__main__':
    merge_sheets()

