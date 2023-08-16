$RemoteUser = "adminuser"
$RemoteHost = "remote_machine_address"
$RemoteDirectory = "/path/to/log/files"

$LocalArchiveDir = "C:\path\to\local\archive\directory"

$Session = New-PSSession -ComputerName $RemoteHost -Credential $RemoteUser


$ScriptBlock = {
    param (
        $RemoteDirectory
    )

Set-Location -Path $RemoteDirectory
Get-ChildItem -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-1) } | ForEach-Object {
    $ArchiveName = $_.Name -replace "\s", "_"
    $ArchivePath = Join-Path -Path $PSScriptRoot -ChildPath $ArchiveName
    Compress-Archive -Path $_.FullName -DestinationPath $ArchivePath
    Remove-Item $_.FullName
}
}
Invoke-Command -Session $Session -ScriptBlock $ScriptBlock -ArgumentList $RemoteDirectory

Remove-PSSession $Session

$RemoteArchivePath = Join-Path -Path $RemoteDirectory -ChildPath "$($env:USERNAME)_archive.zip"
$LocalArchivePath = Join-Path -Path $LocalArchiveDir -ChildPath "$($env:USERNAME)_archive.zip"
Copy-Item -Path "\\$RemoteHost\$RemoteArchivePath" -Destination $LocalArchivePath

Invoke-Command -ComputerName $RemoteHost -Credential $RemoteUser -ScriptBlock {
    param (
        $RemoteArchivePath
    )
    
    Remove-Item $RemoteArchivePath
} -ArgumentList $RemoteArchivePath

Write-Host "Log files archived, downloaded, and cleaned up."
