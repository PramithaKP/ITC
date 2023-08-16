
$array = @()

do {
    $inputValue = Read-Host "Enter a value (type 'done' to finish)"
    if ($inputValue -ne "done") {
        $array += $inputValue
    }
} while ($inputValue -ne "done")

$firstValue = $array[0]
$lastValue = $array[-1]
$middleIndex = [math]::Floor(($array.Length - 1) / 2)
$middleValue = $array[$middleIndex]

Write-Host "First value: $firstValue"
Write-Host "Last value: $lastValue"
Write-Host "Middle value: $middleValue"

$array[0] = "NewFirstValue"
$array[-1] = "NewLastValue"
$array[$middleIndex] = "NewMiddleValue"

# $length = $array.Length1
#Write-Host "Length of the list: $length"

#$secondArray = "SecondValue1", "SecondValue2", "SecondValue3"

#$concatenatedArray = $array + $secondArray

#Write-Host "Concatenated list:"
#$concatenatedArray