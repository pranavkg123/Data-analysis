# -*- coding: utf-8 -*-
"""statsmodels.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1GWCJlsltGdFsS4yWanbQ2_Wii6HFCNs8
"""

from statsmodels.stats.weightstats import ztest

data=[4.8,4.9,5.1,4.7,4.6]
pop_mean=5
alpha=0.05
z_stat,p_value=ztest(data,value=pop_mean,alternative='smaller')
print("Z-Statistics:",z_stat)
print("P-Value:",p_value)
if p_value<alpha:
    print("Reject H0: The mean weight is less than 5 kg.")
else:
    print("Fail to reject H0: No significant evidence that the mean weight is less than 5 kg.")
