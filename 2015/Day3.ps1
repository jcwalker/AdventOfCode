
$totalAddresses = @()

#$santasRoute = '^','>','v','<'
#$santasRoute = ('^v^v^v^v^v').ToCharArray()
$santasRoute = Get-Content -Path "$PSScriptRoot\Day3Input.txt"
$lastHouse = @{
    Lat  = 0
    Long = 0
}

$totalAddresses += $lastHouse

foreach ($stop in $santasRoute.ToCharArray())
{
    $lastHouse = $lastHouse.Clone()
    if ($stop -eq '^')
    {
        $lastHouse.Long++
    }
    elseIf ($stop -eq '>')
    {
        $lastHouse.Lat++
    }
    elseIf ($stop -eq 'v')
    {
        $lastHouse.Long--
    }
    elseIf ($stop -eq '<')
    {
        $lastHouse.Lat--
    }

    $totalAddresses += $lastHouse
}

$group = $totalAddresses | Group-Object -Property long,lat

$group.Count