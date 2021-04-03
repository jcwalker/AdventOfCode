# 2*l*w + 2*w*h + 2*h*l

$presents = Get-Content -Path $PSScriptRoot\Day2Input.txt
$allTheMeasurements = 0

foreach ($present in $presents)
{
    $split = [System.Collections.Generic.List[int]]$present.Split('x') | Sort-Object
    $length, $width, $height = $split
    $area = (2 * $length * $width) + (2 * $width * $height) + (2 * $height * $length)

    $smallestTwoSides = $split[0..1]

    $totalArea = $length * $width * $height
    $ribbon = (2 * $smallestTwoSides[0]) + (2 * $smallestTwoSides[1])

    $allTheMeasurements = $allTheMeasurements + $ribbon + $totalArea
}

$allTheMeasurements
