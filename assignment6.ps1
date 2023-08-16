try {
    $numerator = 10
    $denominator = 0

    $result = $numerator / $denominator
}
catch {
    Write-Host "An error occurred: $($_.Exception.Message)"
}
finally {
    Write-Host "Finally block executed."
}