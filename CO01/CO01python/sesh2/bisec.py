# -*- coding: utf-8 -*-
"""
Created on Mon Dec 21 01:44:59 2020

@author: User
"""

def bisec(func, x1, x2):
    y1 = func(x1)
    y2 = func(x2)
    
    while (x2-x1)>= 1e-10:
        #mid of interval
        x3 = 0.5*(x1 + x2)
        # choose sub of interval based on sign
        if func(x3) == 0:
            return x3
        elif (func(x3)*y1)>0:
            x1 = x3
        else:
            x2 = x3
    
    return x2
            