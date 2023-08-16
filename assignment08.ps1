$hashList = @{}
function Add-Entry {
    param (
        [string]$key,
        [string]$value
    )
    $hashList[$key] = $value
}

function Print-HashList {
    Write-Host "Hash List:"
    foreach ($entry in $hashList.GetEnumerator()) {
        Write-Host "$($entry.Key): $($entry.Value)"
    }
}

if ($args.Length -gt 0) {
    for ($i = 0; $i -lt $args.Length; $i += 2) {
        $key = $args[$i]
        $value = $args[$i + 1]
        Add-Entry -key $key -value $value
    }
} else {
    $numEntries = Read-Host "Enter the number of entries to add:"
    for ($i = 0; $i -lt $numEntries; $i++) {
        $key = Read-Host "Enter a key:"
        $value = Read-Host "Enter a value:"
        Add-Entry -key $key -value $value
    }
}

Print-HashList

Write-Host "Selected Values:"
$selectedKeys = Read-Host "Enter keys (comma-separated) to display values:"
$selectedKeys = $selectedKeys -split ","
foreach ($key in $selectedKeys) {
    if ($hashList.ContainsKey($key)) {
        Write-Host "$key $($hashList[$key])"
    } else {
        Write-Host "$key not found in the hash list"
    }
}

$numChanges = Read-Host "Enter the number of entries to change:"
for ($i = 0; $i -lt $numChanges; $i++) {
    $key = Read-Host "Enter a key:"
    $value = Read-Host "Enter a value:"
    Add-Entry -key $key -value $value
}

Write-Host "Total entries in the hash list: $($hashList.Count)"

$checkKey = Read-Host "Enter a key to check if it's present:"
$isPresent = $hashList.ContainsKey($checkKey)
Write-Host "Is $checkKey present? $isPresent"