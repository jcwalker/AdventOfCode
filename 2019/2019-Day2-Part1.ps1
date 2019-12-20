<#
Once you're done processing an opcode, move to the next one by stepping forward 4 positions.

For example, suppose you have the following program:

1,9,10,3,2,3,11,0,99,30,40,50
For the purposes of illustration, here is the same program split into multiple lines:

1,9,10,3,
2,3,11,0,
99,
30,40,50
The first four integers, 1,9,10,3, are at positions 0, 1, 2, and 3. Together, they represent the first opcode (1, addition), the positions of the two inputs (9 and 10), and the position of the output (3).
To handle this opcode, you first need to get the values at the input positions: position 9 contains 30, and position 10 contains 40. Add these numbers together to get 70. 
Then, store this value at the output position; here, the output position (3) is at position 3, so it overwrites itself. Afterward, the program looks like this:

1,9,10,70,
2,3,11,0,
99,
30,40,50
Step forward 4 positions to reach the next opcode, 2. This opcode works just like the previous, but it multiplies instead of adding.
The inputs are at positions 3 and 11; these positions contain 70 and 50 respectively.
Multiplying these produces 3500; this is stored at position 0:

3500,9,10,70,
2,3,11,0,
99,
30,40,50
Stepping forward 4 more positions arrives at opcode 99, halting the program.

Here are the initial and final states of a few more small programs:

1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2).
2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6).
2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801).
1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99.
Once you have a working computer, the first step is to restore the gravity assist program
(your puzzle input) to the "1202 program alarm" state it had just before the last computer caught fire.
To do this, before running the program, replace position 1 with the value 12 and replace position 2 with the value 2.
What value is left at position 0 after the program halts?
#>

#[System.Collections.ArrayList]$program = '1,9,10,3,2,3,11,0,99,30,40,50' -split ','
[System.Collections.ArrayList]$program = (Get-Content -Path .\2019-Day2-Input.txt -Raw) -split ','
$program[1] = 12
$program[2] = 2
$start = 0

do
{
    $optcode = @()
    $end = $start + 3
    foreach ($number in $program[$start..$end])
    {
        $optcode += $number
    }

    switch ($optcode[0])
    {
        1 {$mathResult = [int]$program[$optcode[1]] + $program[$optcode[2]]}
        2 {$mathResult = [int]$program[$optcode[1]] * $program[$optcode[2]]}
        default {'someting went wrong';continue}
    }

    $program[$optcode[3]] = $mathResult

    $start = $start + 4
}
while ($program[$start] -ne 99)
$program -join ','