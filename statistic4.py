# -*- coding: utf-8 -*-
"""statistic4.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1Z1wKMq0jTiH3-IN6BVqrluVCwbvcexkn
"""

import pandas as pd
from scipy.stats import chi2_contingency
import seaborn as sns

titanic = sns.load_dataset('titanic')

contingency_table = pd.crosstab(titanic['survived'], titanic['sex'])

chi2, p, dof, expected = chi2_contingency(contingency_table)

print("contingency_table", contingency_table)
print("Chi-square statistic:", chi2)
print("p-value:", p)
print("Degrees of freedom:", dof)
print('expected frequencie',expected)

if p < 0.05:
    print("Reject the null hypothesis - variables are n")
else:
    print("Fail to reject the null hypothesis - variables are independent")






