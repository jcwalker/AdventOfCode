<#
    I solved this by looping through input data, and asserting each line is not null.
    If not null add data to a variable.  Once we have all the data in a variable a
    regex is used to match on a semicolon surrounded by non-whitespace.
    The results of the regex is iterated through and placed in a hashtable.
    A hashtable was chosen simply because it has a "Keys" property the return an
    array of all the keys in the hashtable.  Then the required
    passport keys is iterated through asserting each required key is in the keys of the
    hashtable.  If a required key is found not to be in the hashtbale the varaible containing
    the data is reset and we go back to the outer most loop.
#>

$passportData = Get-Content -Path "$PSScriptRoot\AOC2020-Day4.txt"
$passportKeys = 'hcl|iyr|pid|ecl|eyr|byr|hgt' -split '\|'
$passportCount = 0
$passportToProcess = @()

:labelData foreach ($line in $passportData)
{
    if ([string]::IsNullOrWhiteSpace($line) -eq $false)
    {
        $passportToProcess += $line
        continue
    }

    $hashTable = @{}
    $passportProperties = $passportToProcess | Select-String -Pattern '\S+:\S+' -AllMatches

    foreach ($property in $passportProperties.Matches.Value)
    {
        $split = $property -split ':'
        $hashTable[$split[0]] = $split[1]
    }

    foreach ($keyName in $passportKeys)
    {
        if ($keyName -notin $hashTable.Keys)
        {
            $passportToProcess = @()
            continue labelData
        }
    }

    $passportCount++
    $passportToProcess = @()
}

return "There are {0} valid passports." -f $passportCount
