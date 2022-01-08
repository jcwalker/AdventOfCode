#!/usr/bin/env python
import os
from pathlib import Path
import math

pscriptRoot = Path(__file__).resolve().parent
intputFile = os.path.join(pscriptRoot, 'Day3-Input.txt')
file = open(intputFile)

numbers = file.readlines()
columnCount = len(str(numbers[0].strip("\r\n")))

# create dictionary with a key for each column
table = {}
tableCounter = 1

for column in range(0, columnCount):
    newColumn = {"column" + str(tableCounter) : []}
    table.update(newColumn)
    tableCounter += 1

# add values to dictionary
for number in numbers:
    counter = 1
    previous = None
    for num in range(0,columnCount):
        currentColumn = "column" + str(counter)

        table[currentColumn].append(int(number[previous:counter]))
        previous = counter
        counter += 1

# create another table to store the results
results = {}
resultsCounter = 1
# loop through table to populate results
for column in range(0, columnCount):
    currentColumn = "column" + str(resultsCounter)
    gama    = max(table[currentColumn], key = table[currentColumn].count)
    epsilon = min(table[currentColumn], key = table[currentColumn].count)

    results.update({currentColumn + "gama" : gama})
    results.update({currentColumn + "epsilon" : epsilon})
    resultsCounter += 1

# calculate gamarate
gamaRate = ""
epsilonRate = ""
gamaCounter = 1
for column in range(0, columnCount):
    currentGamaColumn = "column" + str(gamaCounter) + "gama"
    currentEpislonColumn = "column" + str(gamaCounter) + "epsilon"

    gamaRate    = gamaRate + str(results[currentGamaColumn])
    epsilonRate = epsilonRate + str(results[currentEpislonColumn])
    gamaCounter += 1

# convert to decimal and multiple
answer = (int(gamaRate, 2) * int(epsilonRate, 2))
print('Anwser: ', answer)
