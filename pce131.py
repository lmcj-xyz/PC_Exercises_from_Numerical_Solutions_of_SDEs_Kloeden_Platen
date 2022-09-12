# -*- coding: utf-8 -*-
"""
Created on Fri Sept 2 11:17 2022

@author: Luis Mario Chaparro Jáquez

@title: PC-Exercise 1.3.1
"""

from random import uniform, expovariate, gauss
from math import log
import matplotlib.pyplot as plt

#unif = []
exp = []
lamb = 0.5
normal = []

for i in range(100):
    sample_unif = uniform(0,1)
    #unif.append(sample_unif)
    exp.append(-log(1 - sample_unif)/lamb)

#plt.figure()
#plt.plot(unif, 'o', ls='-')
#plt.show()

plt.figure()
plt.plot(exp, 'o', ls='-')
plt.show()
