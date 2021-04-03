#$directions = '(()(()('
$directions = Get-Content -Path "$PSScriptRoot\Day1Input.txt" # read file
$result = 0 # initiliaze $result 
$position = 0

foreach ($step in $directions.ToCharArray()) # loop through directions in file
{
    if ($result -eq -1)
    {
        return $position
    }

    $position++

    if ($step -eq '(') # add if ( subtract if )
    {
        $result = $result + 1
        continue
    }

    $result = $result - 1
}

