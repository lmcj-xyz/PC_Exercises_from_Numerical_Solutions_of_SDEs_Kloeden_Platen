# -*- coding: utf-8 -*-
"""
Created on Mon Sept 12 11:23 2022

@author: Luis Mario Chaparro Jáquez

@title: PC-Exercise 1.4.4
"""

from numpy.random import default_rng
rng = default_rng()
from numpy import mean, var
import matplotlib.pyplot as plt

n = 10**4 # Size of the sample
bins = int(5*10e2) # Bins to create the histogram

unif = rng.uniform(low=0.0, high=1.0, size=n) # Sample of points ~ U(0,1)
# Statistics to verify distribution
unif_mean = mean(a=unif) # Sample average
unif_var = var(a=unif) # Sample variance

plt.figure()
plt.hist(x=unif, bins=bins, density=True)
plt.title(label="Histogram of uniformly distributed points\n\nSample variance: %f" % unif_mean + "\nSample average: %f" % unif_var)
plt.show()
