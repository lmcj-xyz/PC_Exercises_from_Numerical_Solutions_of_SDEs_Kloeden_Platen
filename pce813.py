# -*- coding: utf-8 -*-
"""
Created on Tuesday Sept 20 23:50 2022

@author: Luis Mario Chaparro Jáquez

@title: PC-Exercise 8.1.3
"""

from math import exp
import numpy as np
import matplotlib.pyplot as plt

truncate = lambda w: round(w, ndigits=5)

xt1 = truncate(exp(-5*(1))) # Real value at t = 1
y0 = 1 # Initial condition
error = np.zeros(14) # List to store error at different time steps
dt = np.zeros(14) # List to store time steps

for i in range(14): # Loop over the number of time steps
    y = y0
    for j in range(2**i): # Loop over time
        y += truncate(0.5*((-5)*y + (-5)*(y + (-5)*y*(1/2**i)))*(1/2**i))
    # Using only 5 decimal places and taking absolute value for the loglog plot
    error[i] = truncate(abs(xt1 - y))
    dt[i] = 1/2**i

# You might want to uncomment the line below if you want to see the error
#print(error)

x = np.log2(dt)
y = np.log2(error)
A = np.vstack([x, np.ones(len(x))]).T
m, c = np.linalg.lstsq(A, y, rcond=None)[0]

plt.figure()
plt.title(label="Global discretization error at $t=1$\nSlope = %.5f" % m)
plt.loglog(dt, error, marker='o', base=2)
plt.grid()
plt.xlabel("$\log_2(\Delta t)$")
plt.ylabel("$\log_2(e_{t=1})$")
plt.show()
