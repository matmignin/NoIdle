#!/usr/bin/env python3

import pandas as pd

from openpyxl import load_workbook

book = "../x.xlsx"
match = "PRODUCT_CODE"

dfACTIVE = pd.read_excel(book, sheet_name="ACTIVE")
dfDES = pd.read_excel(book, sheet_name="DES")
dfPLAN = pd.read_excel(book, sheet_name="PLAN")
dfSPECS = pd.read_excel(book, sheet_name="SPECS")
# df = pd.read_excel(book, sheet_name="")
# df = pd.read_excel(book, sheet_name="")
# df = pd.read_excel(book, sheet_name="")
mode = "left"

mDES = dfACTIVE.merge(dfDES, how = mode, left_on =match, right_on=match)
mPLAN = mDES.merge(dfPLAN, how = mode, left_on =match, right_on=match)
mSPECS = mPLAN.merge(dfSPECS, how = mode, left_on =match, right_on=match)

with pd.ExcelWriter(book, engine='openpyxl') as writer:
    mDES.to_excel(writer, sheet_name="ACTIVE_DES")
    mPLAN.to_excel(writer, sheet_name="DES_PLAN")
    mSPECS.to_excel(writer, sheet_name="PLAN_SPECS")
    writer.save()

