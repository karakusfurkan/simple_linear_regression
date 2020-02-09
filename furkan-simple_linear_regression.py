#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jan 25 01:54:41 2020

@author: furkan
"""

# Data Preprocessing Template

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
#%%
# Importing the dataset
dataset = pd.read_csv('Salary_Data.csv')
#%%
dataset
#%%
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values
#%%
# Splitting the dataset into the Training set and Test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 1/3, random_state = 0)
#%%
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, y_train)
#%%
y_pred = regressor.predict(X_test)

#%%
#Visualization of data
plt.scatter(X_test, y_test, color = 'red')
plt.plot(X_train, regressor.predict(X_train), color = 'purple')
plt.title('Salary to Experience (Training Set)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()
#The red dots are real values. The line is linear regression.
#%%











