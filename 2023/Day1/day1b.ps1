# $day1Input = @(
#     'two1nine'
#     'eightwothree'
#     'abcone2threexyz'
#     'xtwone3four'
#     '4nineeightseven2'
#     'zoneight234'
#     '7pqrstsixteen'
# )

# oneight
function Resolve-Number
{
    param
    (
        $Value
    )

    switch -regex ($Value)
    {
        '1|one'   {1; break}
        '2|two'   {2; break}
        '3|three' {3; break}
        '4|four'  {4; break}
        '5|five'  {5; break}
        '6|six'   {6; break}
        '7|seven' {7; break}
        '8|eight' {8; break}
        '9|nine'  {9; break}
    }
}

$pattern = '\d|one|two|three|four|five|six|seven|eight|nine'
$day1Input = Get-Content -Path .\day1PuzzleInput.txt

[int[]]$result = @()

foreach ($line in $day1Input)
{
    $numberMatches = Select-String -InputObject $line -Pattern $pattern -AllMatches
    $result += '{0}{1}' -f (Resolve-Number $numberMatches.Matches[0].Value), (Resolve-Number $numberMatches.Matches[-1].Value)
}

#Measure-Command {$result | Measure-Object -Sum}
[System.Linq.Enumerable]::Sum($result)
