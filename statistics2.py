# -*- coding: utf-8 -*-
"""statistics2.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1GWCJlsltGdFsS4yWanbQ2_Wii6HFCNs8
"""

from scipy import stats
import numpy as np
x = 77
mu = 75
std = 10
n = 30

se = std / np.sqrt(n)
z = (x - mu) / se

# Calculate p-value (Two-Tailed)
p_two = 2 * (1 - stats.norm.cdf(abs(z)))
print("Two-Tailed One-Sample Z-Test")
print("Z-Statistics:", z)
print("P-Value:", p_two)
alpha = 0.05
if p_two < alpha:
    print("Reject the null hypothesis. The average score is significantly different from 75.")
else:
    print("Fail to reject the null hypothesis. There is no significant difference in average scores.")
