# -*- coding: utf-8 -*-
"""statistic1.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1GWCJlsltGdFsS4yWanbQ2_Wii6HFCNs8
"""

from scipy import stats
import numpy as np
x=500
mu=505
std=8
n=100
from scipy import stats
import numpy as np
x=500
mu=505
std=8
n=100
se=std/np.sqrt(n)
z=(x-mu)/se
p_left=stats.norm.cdf(z)
print("Left - Tailed One-Sample Z-Test")
print("Z-Statistics:",z)
print("P-Value:",p_left)
alpha=0.05
if p_left<alpha:
    print("Reject H0: The average weight of 500g.")
else:
    print("Fail to reject H0: No significant evidence that the average weight of 500g.")
print("P-Value:",p_left)
alpha=0.05
if p_left<alpha:
    print("Reject H0: The average weight of 500g.")
else:
    print("Fail to reject H0: No significant evidence that the average weight of 500g.")

