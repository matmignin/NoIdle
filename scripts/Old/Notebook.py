#!/usr/bin/env python3
import pandas as pd
import numpy as np

# In[23]:


import pandas as pd
products = pd.read_excel('ProductSpecs.xlsx', sheet_name='PRODUCT', index_col=None, header=0)
products


# In[21]:


specs = pd.read_excel('ProductSpecs.xlsx', sheet_name='PRODUCT_SPEC', index_col=None, header=0)
specs


# In[26]:


m_df = pd.merge(specs, products, how='outer', on='PRODUCT_CODE', indicator=True)
m_df.to_excel('test3.xlsx')


# In[ ]:




