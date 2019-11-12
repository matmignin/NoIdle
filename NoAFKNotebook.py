#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import datetime
import pyautogui
import time
import sys

pyautogui.FAILSAFE = False
numMin = None
if ((len(sys.argv)<2) or sys.argv[1].isalpha() <1):
    numMin = 3
else:
    numMin = int(sys.argv[1])
while(True):
    x=0
    while(x<numMin):
        time.sleep(60)
        x+=1
    for i in range(0,200):
        pyautogui.moveTo(0,i*4)
    pyautogui.moveTo(1,1)
    for i in range(0,3):
        pyautogui.press("shift")
    print("Movement made at {}".format(datetime.now().time()))


# In[ ]:


JULIAN = ["0", "A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M"]
YEAR = datetime.datetime.today().strftime("%y")
LOT = YEAR + "000"
BATCH = YEAR[1] + JULIAN[int(datetime.datetime.today().strftime("%m"))]


# In[ ]:





# In[ ]:




