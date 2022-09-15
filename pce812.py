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
import matplotlib.pyplot as plt

xt1 = exp(-5*(1)) # Real value at t = 1
y0 = 1 # Initial condition
error = [] # List to store error at different time steps
dt = [] # List to store time steps

for i in range(14): # Loop over the number of time steps
    y = y0
    for j in range(2**i): # Loop over time
        y += -5*y*(1/2**i)
    # Using only 5 decimal places and taking absolute value for the loglog plot
    error.append(round(abs(xt1 - y), ndigits=5))
    dt.append(1/2**i)

# You might want to uncomment the line below if you want to see the error
#print(error)

plt.figure()
plt.title(label="Global discretization error at $t=1$")
plt.loglog(dt, error, marker='o', base=2)
plt.xlabel("$\log_2(\Delta t)$")
plt.ylabel("$\log_2(e_{t=1})$")
plt.show()
