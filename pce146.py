# -*- coding: utf-8 -*-
"""
Created on Friday Sept 16 10:28 2022

@author: Luis Mario Chaparro Jáquez

@title: PC-Exercise 1.4.6
"""

from numpy.random import default_rng
rng = default_rng()
import numpy as np
import matplotlib.pyplot as plt

n = 10**4 # Size of the sample
bins = int(10e2) # Bins for the histogram

# Gaussian random numbers generated by the Box-Muller method
# See pp. 12-13 in the book to learn about this method
# You can also check https://en.wikipedia.org/wiki/Box%E2%80%93Muller_transform
unif1_bm = rng.uniform(low=0.0, high=1.0, size=n)
unif2_bm = rng.uniform(low=0.0, high=1.0, size=n)
gauss_bm = np.sqrt(-2*np.log(unif1_bm))*np.cos(2*np.pi*unif2_bm)

# Gaussian random numbers generated by the Polar Marsaglia method
# Terribly inefficient way to do it, but for learning purposes is fine
# See p. 13 in the book to learn about this
# Also https://en.wikipedia.org/wiki/Marsaglia_polar_method
unif1_pm = np.zeros(n)
unif2_pm = np.zeros(n)
for i in range(n):
    v1 = 2
    v2 = 2
    while v1**2 + v2**2 > 1: # Generate uniform RV until v1^2 + v2^2 <= 1
        u1 = rng.uniform(low=0.0, high=1.0)
        u2 = rng.uniform(low=0.0, high=1.0)
        v1 = 2*u1 - 1
        v2 = 2*u2 - 1
    # Assign the value a the uniform if the conditions are satisfied
    unif1_pm[i] = u1
    unif2_pm[i] = u2
vunif1 = 2*unif1_pm - 1
vunif2 = 2*unif2_pm - 1
gauss_pm = vunif1*np.sqrt(-2*np.log(vunif1**2 + vunif2**2)/(vunif1**2 + vunif2**2))

# Expected value and variance to check distribution
gauss_bm_mean = gauss_bm.mean()
gauss_bm_var = gauss_bm.var()
gauss_pm_mean = gauss_pm.mean()
gauss_pm_var = gauss_pm.var()

plt.figure()
plt.hist(x=gauss_bm, bins=bins, density=True, range=(-2.5, 2.5))
plt.title(label="Histogram of Gaussian distributed (Box-Muller)\nSample average: %f" % gauss_bm_mean + "\nSample variance: %f" % gauss_bm_var)
plt.show()

plt.figure()
plt.hist(x=gauss_pm, bins=bins, density=True, range=(-2.5, 2.5))
plt.title(label="Histogram of Gaussian distributed (Polar Marsaglia)\nSample average: %f" % gauss_pm_mean + "\nSample variance: %f" % gauss_pm_var)
plt.show()