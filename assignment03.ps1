param (
    [string]$stringValue,
    [float]$floatValue
)
$outputString = "The input string is: $stringValue`n"
$outputString += "The input float value is: $floatValue"

Write-Host $outputString
