# PSScriptAnalyzer(PSAvoidUsingPlainTextForPassword

<#
--- Part Two ---
An Elf just remembered one more important detail: the two adjacent matching digits are not part of a larger group of matching digits.

Given this additional criterion, but still ignoring the range rule, the following are now true:

112233 meets these criteria because the digits never decrease and all repeated digits are exactly two digits long.
123444 no longer meets the criteria (the repeated 44 is part of a larger group of 444).
111122 meets the criteria (even though 1 is repeated more than twice, it still contains a double 22).
How many different passwords within the range given in your puzzle input meet all of the criteria?

Your puzzle input is still 206938-679128.
#>
function Find-PossiblePassword
{
    param
    (
        [Parameter(Mandatory=$true)]
        [string[]]
        $PossiblePasswords
    )

    foreach ($possiblePassword in $possiblePasswords)
    {
        # check for length 6 digits
        $lengthOfSix = $possiblePassword.length -eq 6

        $similarPairs    = @()
        $doesNotDecrease = @()
        for ($counter = 0; $counter -ne ($possiblePassword.Length -1); $counter++)
        {
            $first  = $possiblePassword[$counter]
            $second = $possiblePassword[$counter+1]

            $doesNotDecrease += ($first -le $second)

            if ($first -eq $second)
            {
                $similarPairs += @{
                    First  = $first
                    Second = $second
                }
            }
        }

        # calculate similar group counts
        $similarPairGroupingCount = $similarPairs | Group-Object -Property First | Select-Object -ExpandProperty Count

        [PSCustomObject]@{
            LengthOfSix      = $lengthOfSix
            SimilarPairs     = ($similarPairGroupingCount -contains 1)
            DoesNotDecrease  = ($doesNotDecrease -notcontains $false)
            PossiblePassword = $possiblePassword
        }
    }
}

$results = Find-PossiblePassword -PossiblePasswords (206938..679128)

$results | ? {$_.LengthOfSix -eq $true -and $_.SimilarPairs -eq $true -and $_.DoesNotDecrease -eq $true} | measure