#!/usr/bin/env python3

import pandas as pd

from openpyxl import load_workbook

book = "x.xlsx"
sheetL = "ACTIVE"
match = "PRODUCT_CODE"

sheetR = "Description"
dfL = pd.read_excel(book, sheet_name=sheetL)
dfR = pd.read_excel(book, sheet_name=sheetR)
dfPLAN = pd.read_excel(book, sheet_name="PLAN")
dfSPECS = pd.read_excel(book, sheet_name="SPECS")
# df = pd.read_excel(book, sheet_name="")
# df = pd.read_excel(book, sheet_name="")
# df = pd.read_excel(book, sheet_name="")
mode = "outer"
# saveAs = "mPRODUCT.xlsx"

mDES = dfL.merge(dfR, how = mode, left_on =match, right_on=match, indicator=True)
mPLAN = mDES.merge(dfPLAN, how = mode, left_on =match, right_on=match)

with pd.ExcelWriter(book, engine='openpyxl') as writer:
    mDES.to_excel(writer, sheet_name=sheetR)
    mPLAN.to_excel(writer, sheet_name="PLAN")
    writer.save()

