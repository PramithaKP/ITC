while ($true) {
    $input = Read-Host "Enter a value (or 'stop' to quit)"
    if ($input -eq "stop") {
        break
    }
    Write-Host "You entered: $input"
}