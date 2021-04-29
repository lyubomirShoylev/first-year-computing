# Imports
import numpy as np
import matplotlib.pyplot as plt

# Load data - don't bother with pandas for a small set
csv = np.genfromtxt('dataFiles/chi2fit.csv', delimiter=",")
# Separate it into 3 vectors
xValues = csv[:, 0] # x coord
yValues = csv[:, 1] # experim mesasure
fValues = csv[:, 2] # theory

# Calculate chi-squared value
deltaY = 5.0 # spread in y values
chiSq = np.sum(np.square((yValues - fValues)/deltaY))

# Plot the data
plt.errorbar(xValues, yValues, deltaY)
plt.plot(xValues, fValues)
# 1. exp data with error bars
# 2. theoretical prediction