$animalName = "Cow"

switch -Wildcard ($animalName) {
    "Dog" { Write-Host "Woof!" }
    "Cat" { Write-Host "Meow!" }
    "Cow" { Write-Host "Moo!" }
    "Duck" { Write-Host "Quack!" }
    default { Write-Host "Unknown animal: $animalName" }
}