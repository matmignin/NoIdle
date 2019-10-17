#!/usr/bin/env python3
import pandas as pd
import numpy as np
from click import command, option, argument

@command()
def selectJJ():
    # data = pd.read_excel('../Queries/ProductSpecs.xlsx', sheet_name='JJ')
    data = pd.read_excel('../Queries/ProductSpecs.xlsx', sheet_name='JJ', index_col=None, usecols= 'A')
    data.columns = ['MatCodes']
    # np.array(data['MatCodes'])
    # data = pd.DataFrame(data,['MatCodes'])
    indexedData=data.reset_index()
    # indexedData=data.set_index('MatCodes')
    # indexedData=data.reset_index()
    indexedData=indexedData.set_index('index')
    # indexedData=data.set_index('MatCodes')
    # indexedData.to_excel('testWorkbook.xlsx', index=False)
    print(indexedData.values)
    dft=indexedData.values
    dft.to_excel('testbook2.xlsx')

def productList():
    Data2 = pd.read_excel('../Queries/ProductSpecs.xlsx', sheet_name='PRODUCT')
    Data2.columns = ['MatCodes']
    df2= pd.DataFrame(Data, columns= ['MatCodes'])
    # df2 = df.set_index(['MatCodes'])
    df2.to_excel('testWorkbook.xlsx')
    print(df2head)

if __name__== '__main__':
    selectJJ()

dft

