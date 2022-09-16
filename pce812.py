# -*- coding: utf-8 -*-
"""
Created on Thursday Sept 15 15:05 2022

@author: Luis Mario Chaparro Jáquez

@title: PC-Exercise 8.1.2

Here you don't actually need the solution of the ODE, just the value at the last
point in time. This is why the solution is not stored.
And we don't use NumPy since anyway the Euler method has to be a for loop even
using NumPy.
"""

from math import exp
import numpy as np
import matplotlib.pyplot as plt

# The exercise asks to truncate to observe the round off error
# You have to truncate every time otherwise Python will compute things
# very preciselly and we do not want that for this exercise
truncate = lambda w: round(w, ndigits=5) # Truncate function for concise coding

xt1 = truncate(exp(-5*(1))) # Real value at t = 1
y0 = 1 # Initial condition
error = np.zeros(14) # List to store error at different time steps
dt = np.zeros(14) # List to store time steps

for i in range(14): # Loop over the number of time steps
    y = y0
    for j in range(2**i): # Loop over time
        y += truncate(-5*y*(1/2**i))
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
