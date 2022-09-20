# -*- coding: utf-8 -*-
"""
Created on Tuesday Sept 13 11:19 2022

@author: Luis Mario Chaparro Jáquez

@title: PC-Exercise 
"""

from numpy.random import default_rng
rng = default_rng()
from numpy import mean, var
import matplotlib.pyplot as plt

n = 10**4 # Size of the sample
bins = int(5*10e2) # Bins for the histogram
lamb = 2 # Parameter lambda

expon = rng.exponential(scale=1/lamb, size=n) # Sample of points ~ Exp(lambda)
# Statistics to explore distribution
expon_mean = mean(a=expon) # Sample average
expon_var = var(a=expon) # Sample variance

plt.figure()
# The parameter range below fulfills the requirement of the exercise
# to ignore the values larger than 2, you can change it or remove it
# to explore what happens
plt.hist(x=expon, bins=bins, density=True, range=(0., 2.))
plt.title(label="Histogram of exponentially distributed points\n\nSample variance: %f" % expon_mean + "\nSample average: %f" % expon_var)
plt.show()
