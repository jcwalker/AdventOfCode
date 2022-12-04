
$list = Get-Content -Path "C:\repos\AdventOfCode\2022\Day1Input.txt"

$result = [System.Collections.Generic.List[int]]::new()
$curent = 0

foreach ($line in $list)
{
    if (![string]::IsNullOrWhiteSpace($line))
    {
        $curent = $curent + $line
    }
    else
    {
        $result.Add($curent)
        $curent = 0
    }
}

Measure-Command {
$result | Sort-Object -Descending | Select-Object -First 1
}

$result | Sort-Object -Descending | Select-Object -Last 1


$resultFromLinq = [System.Linq.Enumerable]::OrderByDescending[int, int](
    $result,
    [Func[int, int]]{ param($item)  $item }
)

Measure-Command {
[System.Linq.Enumerable]::Max($result)
}
