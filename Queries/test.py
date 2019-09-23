#!/usr/bin/env python3

import pandas as pd
from click import command, option, argument


@command()
@argument('book1')
@argument('sheet1')
@argument('column1')
def merge_sheets(book1, sheet1):
    Data = pd.read_excel('ProductSpec.xlsx', sheet_name='JJ', parse_cols=0, index_col=0)
    Data.columns = ['MatCodes´]
    df = pd.DataFrame(Data, columns= [column1])
    df.to_excel('test.xlsx')
    df.loc(


if __name__== '__main__':
    merge_sheets()

process.extractOne("typo",choices=state_to_code.keys(),score_cutoff=80)

