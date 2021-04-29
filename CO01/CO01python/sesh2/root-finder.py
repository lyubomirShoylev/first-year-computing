# -*- coding: utf-8 -*-
"""
Created on Mon Dec 21 01:43:08 2020

@author: User
"""
# will find roots in two ways: bisection and newton-raphson

from bisec import *
# from newRaph import *
import math

f = lambda x: 3*math.exp(-x) - x + 3

print(bisec(f,2,4))