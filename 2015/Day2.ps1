# 2*l*w + 2*w*h + 2*h*l

$presents = Get-Content -Path $PSScriptRoot\Day2Input.txt
$allTheMeasurements = @()

foreach ($present in $presents)
{
    # covert Number(x)Number(x)Number in number,number,number
    [int]$length, [int]$width, [int]$height = $present.Split('x')
    # calculate total area of box
    [int]$area = (2 * $length * $width) + (2 * $width * $height) + (2 * $height * $length)

    # calculate area of all sides
    $side1 = $length * $width
    $side2 = $length * $height
    $side3 = $width  * $height

    # sort to find the smallest
    $smallestSide = ($side1,$side2,$side3 | Sort-Object)[0]

    # add smallest side to area
    $answer = $area + $smallestSide

    # add answer to running total
    $allTheMeasurements += $answer
}

# get the sum of running total
$allTheMeasurements | Measure-Object -Sum
