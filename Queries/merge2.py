#!/usr/bin/env python3

import pandas as pd
from click import command, option, argument



@command()
@argument('sheet1', 'sheet2', 'key')
def merge_sheets('sheet1', 'sheet2', 'key')
    df1 = pd.read_excel('sheet1.xlsx')
    df2 = pd.read_excel('sheet2.xlsx')

    merged_df = df2.merge(df1, how = 'inner', on = ['key'])

    merged_df.to_excel("merged.xlsx", sheet_name='All')

if __name__== '__main__':
    merge_sheets()
