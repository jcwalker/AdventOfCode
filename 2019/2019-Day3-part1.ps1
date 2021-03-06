
function Get-PathTraveled
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [string[]]
        $Directions
    )

    [System.Collections.ArrayList]$history = @()
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
            $locationBefore['x']..$location['x'] | ForEach-Object -Process {$history.Add(('x' + $PSItem + ',' + 'y' + $location['y'])) | Out-Null}
        }
        else
        {
            $locationBefore['y']..$location['y'] | ForEach-Object -Process {$history.Add(('x' + $location['x'] + ',' + 'y' + $PSItem)) | Out-Null}
        }
    }

    [PSCustomObject]@{
        Location = $location
        History  = $history
    }
}

function Get-PathesCrossed
{
    [CmdletBinding()]
    param
    (
        [Parameter()]
        [object[]]
        $PathOne,

        [Parameter()]
        [object[]]
        $PathTwo
    )

    [System.Collections.ArrayList]$commonStops = @()

    foreach ($stopInPathA in $PathOne)
    {

        if ($PathTwo.Contains($stopInPathA))
        {
            $commonStops.Add($stopInPathA) | Out-Null
        }
    }

    return $commonStops
}

function Get-ManhattanDistance
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [string]
        $CordinanceOne,

        [Parameter(Mandatory=$true)]
        [string]
        $CordinanceTwo
    )
    # |x1 - x2| + |y1 - y2|

    $c1x, $c1y = $CordinanceOne -split ','
    $c2x, $c2y = $CordinanceTwo -split ','

    return [math]::Abs($c1x.Substring(1) - $c2x.Substring(1)) + [math]::Abs($c1y.Substring(1) - $c2y.Substring(1))
}

$pathOne, $pathTwo = (Get-Content -Path $PSScriptRoot\2019-Day3-Input.txt) -split '\n'
$a = Get-PathTraveled -Directions ($pathOne -split ',')
$b = Get-PathTraveled -Directions ($pathTwo -split ',')

$crossRoads = Get-PathesCrossed -PathOne $a.History -PathTwo $b.History | Where {$_ -ne 'x0,y0'}

$crossRoads | %{ Get-ManhattanDistance -CordinanceOne 'x0,y0' -CordinanceTwo $_} | sort | select -First 1
