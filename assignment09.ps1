$myDictionary = @{
    "Key1" = "Value1"
    "Key2" = "Value2"
    "Key3" = "Value3"
}

foreach ($key in $myDictionary.Keys) {
    $value = $myDictionary[$key]
    Write-Host "Key: $key, Value: $value"
}

$myArr = @(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

for ($i = 0; $i -lt $myArr.Length; $i += 2) {
    Write-Host "Odd Element: $($myArr[$i])"
}
