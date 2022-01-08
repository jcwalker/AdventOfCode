#!/usr/bin/env python
import os
from pathlib import Path
import math

pscriptRoot = Path(__file__).resolve().parent
intputFile = os.path.join(pscriptRoot, 'Day3-Input.txt')
file = open(intputFile)

numbers = file.readlines()
columnCount = len(str(numbers[0].strip("\r\n")))

def GetAirRating(airType):
    for column in range(0, columnCount):
        if column == 0:
            numberList = numbers
        else:
            numberList = list(results)

        results = list()
        currentColumnList = list()
        for number in numberList:
            currentRow = list()
            currentRow.extend(str(number))
            currentColumnList.append(currentRow[column])

        ones = currentColumnList.count('1')
        zereos = currentColumnList.count('0')

        if ones > zereos:
            max = '1'
        elif ones < zereos:
            max = '0'
        else:
            max = None

        if ones < zereos:
            less = '1'
        elif ones > zereos:
            less = '0'
        else:
            less = None

        if airType == 0:
            valueType = less
        else:
            valueType = max
        # loop through table to populate results
        for number in numberList:
            row = list(str(number))
            if valueType != None:
                if row[column] == valueType:
                    results.append(''.join(row))
            else:
                if row[column] == str(airType):
                    results.append(''.join(row))
        
        if len(results) == 1:
            break

    return int(results[0], 2)

o2Result = GetAirRating(1)
co2Result = GetAirRating(0)

answer = (o2Result * co2Result)
print('Anwser: ', answer)
