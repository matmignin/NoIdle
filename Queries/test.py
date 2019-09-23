#!/usr/bin/env python3

import pandas as pd
from click import command, option, argument


@command()
@argument('book1')
@argument('sheet1')
@argument('column1')
def merge_sheets(book1, sheet1):
    Data = pd.read_excel('ProductSpec.xlsx', sheet_name='JJ')
    df = pd.DataFrame(Data, columns= [column1])
    df.to_excel('test.xlsx')


if __name__== '__main__':
    merge_sheets()

