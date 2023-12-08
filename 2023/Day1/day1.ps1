$input = @(
    '1abc2'
    'pqr3stu8vwx'
    'a1b2c3d4e5f'
    'treb7uchet'
)

[int[]]$result = @()

foreach ($line in $input)
{
    $numberMatches = Select-String -InputObject $line -Pattern '\d' -AllMatches
    $result += '{0}{1}' -f $numberMatches.Matches[0].Value, $numberMatches.Matches[-1].Value
}

Measure-Command {$result | Measure-Object -Sum}

Measure-Command { [System.Linq.Enumerable]::Sum($result)}
