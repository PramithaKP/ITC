
New-Item -Path "C:\temp\input.txt" -ItemType File -Force
Directory: C:\temp
$line = "This is line number 1"
Add-Content -Value $line -Path "C:\temp\input.txt"
Add-Content -Value "This is line number 2" -Path "C:\temp\input.txt"
$line = "This is line number 3"
$line | Add-Content -Path "C:\temp\input.txt"

$oddCounter = 1
$evenCounter = 0

foreach ($line in $lines) {
    if ($oddCounter % 2 -eq 1) {
        $line | Out-File -Append -FilePath "temp/odd_input.txt"
    } else {
        $line | Out-File -Append -FilePath "temp/even_input.txt"
    }
    $oddCounter++
    $evenCounter++
}


 