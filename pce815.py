# -*- coding: utf-8 -*-
"""
Created on Wednesday Sept 21 12:06 2022

@author: Luis Mario Chaparro Jáquez

@title: PC-Exercise 8.1.5
"""

from math import exp
import numpy as np
import matplotlib.pyplot as plt

xt1 = exp(-5*(1)) # Real value at t = 1
y0 = 1 # Initial condition
y = [0, 0, 0]
error = np.zeros(14)
dt = np.zeros(14) # List to store time steps

for i in range(14): # Loop over the number of time steps
    y[0] = y0
    delta = 1/2**i
    for j in range(2): # Loop over time for the first three elements
        print(j)
        # Heun method
        y[j+1] += 0.5*(-5*y[j] - 5*(y[j] - 5*y[j]*delta))*delta
    print(y)
    for j in range(3, 2**i):
        print(j)
        y[j+1] += (1/12)*(-23*5*y[j] + 16*5*y[j-1] - 5*5*y[j-2])*delta
    error[i] = abs(xt1 - y[-1])
    dt[i] = 1/2**i

# You might want to uncomment the line below if you want to see the error
#print(error)

x = np.log2(dt)
ye = np.log2(error)
A = np.vstack([x, np.ones(len(x))]).T
m, c = np.linalg.lstsq(A, ye, rcond=None)[0]

plt.figure()
plt.title(label="Global discretization error at $t=1$\nSlope Adams-Bashford = %f" % (m))
plt.loglog(dt, error, marker='o', base=2)
plt.grid()
plt.xlabel("$\log_2(\Delta t)$")
plt.ylabel("$\log_2(e_{t=1})$")
plt.show()
