#!/usr/bin/env python
import os
from pathlib import Path

parent = Path(__file__).resolve().parent
intputFile = os.path.join(parent, 'Day3-Sample.txt')
file = open(intputFile)

column1 = []
column2 = []
column3 = []
column4 = []
column5 = []

numbers = file.readlines()
# 00100
for number in numbers:
    column1.append(number[:1])
    column2.append(number[1:2])
    column3.append(number[2:3])
    column4.append(number[3:4])
    column5.append(number[4:5])

# most common
gama1    = max(column1, key = column1.count)
epsilon1 = min(column1, key = column1.count)
gama2 = max(column2, key = column2.count)
epsilon2 = min(column2, key = column2.count)
mode3 = mode(column3)
mode4 = mode(column4)
mode5 = mode(column5)

gamaRate = mode1 + mode2 + mode3 + mode4 + mode5
print(gamaRate)
print(multimode(column1))

