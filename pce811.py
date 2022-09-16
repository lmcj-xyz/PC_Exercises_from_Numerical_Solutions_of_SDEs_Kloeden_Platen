# -*- coding: utf-8 -*-
"""
Created on Wednesday Sept 14 11:16 2022

@author: Luis Mario Chaparro Jáquez

@title: PC-Exercise 8.1.1
"""

import numpy as np
import matplotlib.pyplot as plt

# Computation of the real solution of the IVP
t = np.linspace(0, 1, 2**5)
x = np.exp(-5*t)
x0 = 1 # Initial condition

# Euler method for step size 2^(-3)
dt1 = 2**(-3) # Step size
t1 = np.linspace(0, 1, int(1/dt1))
y1 = np.zeros_like(t1)
y1[0] = x0 # Initial condition assignation
for i in range(np.shape(t1)[0]-1): # Euler method
    y1[i+1] = y1[i] + (-5*y1[i])*dt1

# Euler method for step size 2^(-5)
dt2 = 2**(-5) # Step size
t2 = np.linspace(0, 1, int(1/dt2))
y2 = np.zeros_like(t2)
y2[0] = x0 # Initial condition assignation
for i in range(np.shape(t2)[0]-1): # Euler method
    y2[i+1] = y2[i] + (-5*y2[i])*dt2

plt.figure()
plt.title("Euler scheme approximation and comparison with exact solution")
plt.plot(t, x, label="Exact solution $x(t) = e^{-5t}$")
plt.plot(t1, y1, label="Approximation with steps of lengt $2^{-3}$")
plt.plot(t2, y2, label="Approximation with steps of lengt $2^{-5}$")
plt.xlabel("t")
plt.ylabel("Solution")
plt.legend()
plt.show()
