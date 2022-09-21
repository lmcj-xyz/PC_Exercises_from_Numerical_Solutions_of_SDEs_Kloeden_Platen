# -*- coding: utf-8 -*-
"""
Created on Tuesday Sept 20 23:50 2022

@author: Luis Mario Chaparro Jáquez

@title: PC-Exercise 8.1.3

Looking at the results in the book it seems you do not have to truncate anymore,
so I removed that, even though it clearly says that you must follow 
PC-Exercise 8.1.2.

So, since it asks you to compare with the Euler method from previous Exercise,
I include that here without the truncation. This is the second figure produced,
while the first one is the one that appears in the book.
"""

from math import exp
import numpy as np
import matplotlib.pyplot as plt

xt1 = exp(-5*(1)) # Real value at t = 1
y0 = 1 # Initial condition
error_euler = np.zeros(14) # List to store error at different time steps
error_heun = np.zeros(14)
dt = np.zeros(14) # List to store time steps

for i in range(14): # Loop over the number of time steps
    y_euler = y0
    y_heun = y0
    delta = 1/2**i
    for j in range(2**i): # Loop over time
        # Euler method
        y_euler += -5*y_euler*delta
        # Heun method
        y_heun += 0.5*(-5*y_heun - 5*(y_heun - 5*y_heun*delta))*delta
    error_euler[i] = abs(xt1 - y_euler)
    error_heun[i] = abs(xt1 - y_heun)
    dt[i] = 1/2**i

# You might want to uncomment the line below if you want to see the error
#print(error)

x = np.log2(dt)
ye_euler = np.log2(error_euler)
ye_heun = np.log2(error_heun)
A = np.vstack([x, np.ones(len(x))]).T
m_euler, c_euler = np.linalg.lstsq(A, ye_euler, rcond=None)[0]
m_heun, c_heun = np.linalg.lstsq(A, ye_heun, rcond=None)[0]

# This is the picture that appears in the book
plt.figure()
plt.title(label="Global discretization error at $t=1$\nSlope Euler = %f" % (m_euler))
plt.loglog(dt, error_euler, marker='o', base=2)
plt.grid()
plt.xlabel("$\log_2(\Delta t)$")
plt.ylabel("$\log_2(e_{t=1})$")
plt.show()

# This is the comparison of the Euler and Heun methods
plt.figure()
plt.title(label="Comparison of global discretization error at $t=1$ with different methods\nSlope Euler = %f\nSlope Heun = %f" % (m_euler, m_heun))
plt.loglog(dt, error_euler, marker='o', base=2, label="Euler method")
plt.loglog(dt, error_heun, marker='*', base=2, label="Heun method")
plt.grid()
plt.xlabel("$\log_2(\Delta t)$")
plt.ylabel("$\log_2(e_{t=1})$")
plt.legend()
plt.show()
