$number1 = Read-Host "Enter the first integer"
$number2 = Read-Host "Enter the second integer"
$number1 = [int]$number1
$number2 = [int]$number2
$sum = $number1 + $number2
Write-Host "The sum of $number1 and $number2 is $sum"