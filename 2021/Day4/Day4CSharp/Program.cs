//string[,] cells = new string[width, height];
//cells[x, y] = "z";

using System;
using System.IO;
using System.Text.RegularExpressions;
using System.Collections.Generic;

int rowCounter = 0;


var samplePath = "C:\\repos\\AdventOfCode\\2021\\Day4\\Day4-Sample.txt";
var sample = File.ReadAllLines(samplePath);
Regex r = new Regex("\\s");

foreach (var line in sample)
{
    if (line.Contains(","))
    {
        var turns = line;
        continue;
    }

    Match match = r.Match(line);

    if (match.Success)
    {
        // at this point we should have a new card
        Card newCard = new Card();
        rowCounter++;
       int columnCounter = 0;

        foreach (var number in line.Split(" "))
        {
            if (!String.IsNullOrWhiteSpace(number))
            {
                // create a new Square
                columnCounter++;
                int num = Convert.ToInt32(number);
                Square newSquare = new (num, columnCounter, rowCounter);
                newCard.Squares.Add(newSquare);
            }
        }
        // add card to game
    }
}

// play game

class Square
{
    private int Value {get; set;}
    public bool Picked {get; set;}
    public int Column {get; set;}
    public int Row {get; set;}

    public Square(int num, int col, int row)
    {
        this.Value = num;
        this.Picked = false;
        this.Column = col;
        this.Row = row;
    }
}

class Card
{
    public List<Square> Squares { get; } = new List<Square>();

    public Card() {}
}

class Game
{
    public int[] Turns {get; set;}
}