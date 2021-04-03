
function Add-ChildHashTable
{
    param
    (
        $HashTable,
        $Key,
        $Value,
        $RootKey
    )

    $workingHashTable = $HashTable.Clone()
    $counter = 0
    $result = [System.String]::Empty
    while ($workingHashTable -is [hashtable])
    {
        $workingHashTable = $workingHashTable.$($workingHashTable.Keys)
        $counter++
    }

    1..$counter | ForEach-Object -Process {$result += '.Values' }

    if ($counter -gt 1)
    {
        $command = '$HashTable{0} = {1}' -f $result, "@{$Key = '$Value'}"
    }
    else
    {
        $command = '$HashTable.{0} = {1}' -f $RootKey, "@{$Key = '$Value'}"
    }
    Invoke-Expression -Command $command

    return $HashTable
}