$directions = 'R8,U5,L5,D3' -split ','

function Get-PathTraveled
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [string[]]
        $Directions
    )

    $history = @()
    $location = @{
        x = 0
        y = 0
    }

    foreach ($step in $Directions)
    {
        $azimuth  = $step.Substring(0,1)
        $distance = $step.Substring(1)
        $locationBefore = $location.Clone()
        switch ($azimuth)
        {
            'R' {$location['x'] = $location['x'] + $distance}
            'L' {$location['x'] = $location['x'] - $distance}
            'U' {$location['y'] = $location['y'] + $distance}
            'D' {$location['y'] = $location['y'] - $distance}
        }

        if ($locationBefore['x'] -ne $location['x'])
        {
            $locationBefore['x']..$location['x'] | ForEach-Object -Process {$history += 'x' + $PSItem + ',' + 'y' + $location['y']}
        }
        else
        {
            $locationBefore['y']..$location['y'] | ForEach-Object -Process {$history += 'x' + $location['x'] + ',' + 'y' + $PSItem}
        }
    }

    [PSCustomObject]@{
        Location = $location
        History  = $history
    }
}

$a = Get-PathTraveled -Directions ('R8,U5,L5,D3' -split ',')
$b = Get-PathTraveled -Directions ('U7,R6,D4,L4' -split ',')