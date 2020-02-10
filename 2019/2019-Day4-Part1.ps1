<#
--- Day 4: Secure Container ---
You arrive at the Venus fuel depot only to discover it's protected by a password. The Elves had written the password on a sticky note, but someone threw it out.

However, they do remember a few key facts about the password:

It is a six-digit number.
The value is within the range given in your puzzle input.
Two adjacent digits are the same (like 22 in 122345).
Going from left to right, the digits never decrease; they only ever increase or stay the same (like 111123 or 135679).
Other than the range rule, the following are true:

111111 meets these criteria (double 11, never decreases).
223450 does not meet these criteria (decreasing pair of digits 50).
123789 does not meet these criteria (no double).
How many different passwords within the range given in your puzzle input meet these criteria?

Your puzzle input is 206938-679128.

Answer:  

You can also [Share] this puzzle.
#>
function Find-PossiblePassword
{
    [string[]]$possiblePasswords = 206938..679128

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
            $similarPairs    += $first -eq $second
        }

        [PSCustomObject]@{
            LengthOfSix      = $lengthOfSix
            SimilarPairs     = ($similarPairs -contains $true)
            DoesNotDecrease  = ($doesNotDecrease -notcontains $false)
            PossiblePassword = $possiblePassword
        }
    }
}

$results = Find-PossiblePassword
$results | ? {$_.LengthOfSix -eq $true -and $_.SimilarPairs -eq $true -and $_.DoesNotDecrease -eq $true} | measure
