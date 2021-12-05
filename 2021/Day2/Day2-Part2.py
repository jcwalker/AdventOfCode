#!/usr/bin/env python
import os
from pathlib import Path

parent = Path(__file__).resolve().parent
intputFile = os.path.join(parent, 'Day2-Input.txt')
file = open(intputFile)

moves = file.readlines()
horizontal = 0
depth = 0
aim =0

for move in moves:
    split = move.split(' ')

    if split[0] == 'forward':
        horizontal += int(split[-1])
        if aim > 0:
            depth += aim * int(split[-1])
    elif split[0] == 'down':
        aim += int(split[-1])
    elif split[0] == 'up':
        aim -= int(split[-1])

print('Horizontal ', horizontal)
print('Depth ', depth)
print(horizontal * depth)