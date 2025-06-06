# -*- coding: utf-8 -*-
"""statistics.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1_6d00AoLwbKaYYVuMC1GaSF_0MdWC9Ic
"""

import numpy as np
from scipy import stats
sample_data = [6, 7, 5, 4, 6, 5, 7, 5, 6, 5, 4, 6, 7, 5, 6, 5, 7, 6, 6, 5, 4, 6, 5, 6, 5]
population_mean = 5
t_statistic, p_value = stats.ttest_1samp(sample_data, population_mean)
print(f"T-statistic: {t_statistic}")
print(f"P-value: {p_value}")

# Determine the result
alpha = 0.05
if p_value < alpha:
    print("Reject the null hypothesis: The sample mean is significantly different from the population mean.")
else:
    print("Fail to reject the null hypothesis: The sample mean is not significantly different from the population mean.")



