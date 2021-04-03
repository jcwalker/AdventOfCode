'BFFFBBFRRR' # row 70 column 7 seat id 567
'FFFBBBFRRR' # row 14 column 7 seat id 119
'BBFFBBFRLL' # row 102 column 4 seat id 820

$example = 'FBFBBFFRLR'
$example = 'BBFFBBFRLL'

$rows = @{Start = 0; End = 127}
$columns = @{Start = 0; End = 7}
foreach ($position in $example.ToCharArray())
{
    switch ($position)
    {
        'F' {
            $half = (($rows.End - $rows.Start)+1)/2
            $result = $rows.End - $half
            $rows = @{
                Start = $rows.Start
                End   = $result
            }
        }
        'B' {
            $half = (($rows.End - $rows.Start)+1)/2
            $result = $rows.Start + $half
            $rows = @{
                Start = $result
                End = $rows.End
            }
        }
        'L' {
            $half = (($columns.End - $columns.Start)+1)/2
            $result = $columns.End - $half
            $columns = @{
                Start = $columns.Start
                End   = $result
            }
        }
        'R' {
            $half = (($columns.End - $columns.Start)+1)/2
            $result = $columns.Start + $half
            $columns = @{
                Start = $result
                End = $columns.End
            }
        }
    }
}

return $rows.Start * 8 + $columns.Start
