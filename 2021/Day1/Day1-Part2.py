#!/usr/bin/env python
import os
from pathlib import Path

parent = Path(__file__).resolve().parent
intputFile = os.path.join(parent, 'Input.txt')
file = open(intputFile)

numbers = file.readlines()
counter = 1
increasedCounter = 0
current = int(0)
previous = 0

for number in numbers:
    # get three consecutive numbers, then add together
    inumber = int(number)
    current += int(inumber)

    if counter >= 3:
        # compare to previous number
        current = int(numbers[counter -3]) + int(numbers[counter-2]) + int(numbers[counter-1])
        if current > previous and previous != 0:
            increasedCounter += 1
        previous = current
        current = 0

    counter += 1

print('Increased ', increasedCounter, ' times')
