using System;
using System.Collections.Generic;

// instanciate bingoCard
List<BingoCard> bingoCards = new();
List<string> cardPlaceHolder = new();

//List<string> // List<Character> heroCharacterList = new();

// read file with bingo cards
string cardsSampleFilePath = "Day4-CardsSample.txt";
string[] lines = System.IO.File.ReadAllLines(cardsSampleFilePath);


// organize input in groups
foreach (string line in lines)
{
    if (!string.IsNullOrWhiteSpace(line))
    {
        cardPlaceHolder.Add(line);
    }

    if (cardPlaceHolder.Count == 5)
    {
        bingoCards.Add(new BingoCard(cardPlaceHolder));
        cardPlaceHolder.Clear();
    }
}



// populate Grids

class BingoCard
{
    public Column Columns {get; set;}
    public Row Rows {get; set;}

    public BingoCard(List<string> card)
    {
        // populate Columns
        foreach (string line in card.ToArray())
        {
            // split on space
            string [] numbers = line.Split(' ');

            foreach (string number in numbers)
            {
                
            }
        }
    }
}

class Grid
{
    public int Value {get ; set;}
    public bool IsDrawn {get; set;}

    public Grid(string num)
    {
        this.Value = Convert.ToInt32(num);
        this.IsDrawn = false;
    }
}

class Column
{
    public Grid []  Grids {get; set;}
}

class Row
{
    public Grid []  Grids {get; set;}
}

