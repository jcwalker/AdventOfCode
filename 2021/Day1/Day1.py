#!/usr/bin/env python
import os
from pathlib import Path

parent = Path(__file__).resolve().parent
intputFile = os.path.join(parent, 'Input.txt')
file = open(intputFile)

numbers = file.readlines()
counter = 0
increasedCounter = 0
decreasedCounter = 0

for number in numbers:
    # check for second index
    inumber = int(number)
    if counter > 0:
        # compare to previous number
        if inumber > previous:
            increasedCounter += 1
        else:
            decreasedCounter += 1

    previous = inumber
    counter += 1

print('Increased ', increasedCounter, ' times')
print('Decreased ', decreasedCounter, ' times')
print('Counter ', counter)
