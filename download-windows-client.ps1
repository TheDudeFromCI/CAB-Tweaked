if (Test-Path \.mods) {
    Remove-Item \.mods -Force
}

if (Test-Path \.resourcepacks) {
    Remove-Item \.resourcepacks -Force
}

New-Item -Path mods -ItemType Directory
New-Item -Path resourcepacks -ItemType Directory

foreach($url in Get-Content .\common-mods.txt) {
    $path = ".\" + $(Split-Path -Path $url -Leaf)
    Invoke-WebRequest -Uri $url -OutFile $path
}

foreach($url in Get-Content .\client-mods.txt) {
    $path = ".\mods" + $(Split-Path -Path $url -Leaf)
    Invoke-WebRequest -Uri $url -OutFile $path
}

foreach($url in Get-Content .\client-resourcepacks.txt) {
    $path = ".\resourcepacks" + $(Split-Path -Path $url -Leaf)
    Invoke-WebRequest -Uri $url -OutFile $path
}

