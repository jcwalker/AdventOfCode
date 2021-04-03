Import-Module C:\source\AdventOfCode\2019\Day6-Scratch.ps1
$map = @(
    'COM=B'
    'B=C'
    'B=G'
    'G=H'
)

$answer = @{}

foreach ($center in $map)
{
    # check if hashtable is empty.
    $route = $center -split '='
    if ($answer.Count -eq 0)
    {
        $answer = @{$route[0] = $route[1]}
        $rootKey = $route[0]
    }

    # check if key is present as a value, if true recurse and set value as a key in a hashtable
    if ($answer.Values -contains $route[0] -or $answer.Values.Keys)
    {
        $answer = Add-ChildHashTable -HashTable $answer -Key $route[0] -Value $route[1] -RootKey $rootKey
    }

    # why did I do this?
    <#
    while ($test -is [hashtable])
    {
        $test = $test.$($test.Keys)
        $test
    }
    #>
}

