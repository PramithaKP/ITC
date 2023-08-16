$age = Read-Host "Enter person's age:"
$gender = Read-Host "Enter person's gender (M/F):"

if ($gender -eq "M") {
    if ($age -lt 18) {
        Write-Output "Master"
    } elseif($age -lt 50) {
        Write-Output "Mr."
    }
} elseif ($gender -eq "F") {
    if ($age -lt 18) {
        Write-Output "Miss"
    } elseif ($age -lt 50) {
        Write-Output "Mrs."
    } 
} else {
    Write-Output "Invalid gender input."
}
