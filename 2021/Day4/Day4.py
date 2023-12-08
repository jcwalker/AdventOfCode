#!/usr/bin/env python
import os
from pathlib import Path

pscriptRoot = Path(__file__).resolve().parent
intputFile = os.path.join(pscriptRoot, 'Day4-Sample.txt')
file = open(intputFile, 'r')

#bingoData = file.readlines()
readLine = file.read()

def ParseBingoCard(entry):
    card = list()
    for line in entry.split('\n'):
        card.append(line)
    return card

def ConvertToInt(stringList):
    result = list()
    for number in stringList.split():
        result.append(int(number))
    return result


bingoData = readLine.split('\n\n')
drawNumbers = bingoData[0].split(',')
resultTracker = list()

cards = list()
for entry in bingoData[1:(len(bingoData))]:
    cards.append(ParseBingoCard(entry))

cardCounter = 0
for card in cards:
    lineCounter = 0
    cardCounter += 1
    for line in card:
        matchCounter = 0
        turnCounter = 0
        lineCounter += 1
        for draw in drawNumbers:
            for number in line.split():
                turnCounter += 1
                if number == draw:
                    matchCounter += 1
                if matchCounter == 5:
                    resultTable = {}
                    resultTable.update({'Draw': draw})
                    resultTable.update({'Turns':turnCounter})
                    resultTable.update({'Line': line})
                    matchMessage = 'card ' + str(cardCounter) + ' line ' + str(lineCounter) + ' has a match in turns' + str(turnCounter) + ' with draw ' + str(draw)
                    resultTable.update({'message':matchMessage})
                    resultTracker.append(resultTable)

def myFunc(e):
  return e['Turns']

resultTracker.sort(key=myFunc)
lineList = ConvertToInt(resultTracker[0]['Line'])
resultMessage = ''
print()


