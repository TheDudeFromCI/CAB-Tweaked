Write-Output "Clearing existing mod folder."
if (Test-Path -Path .\mods) {
    Remove-Item .\mods -Force -Recurse -Confirm:$false
}
New-Item -Path .\mods -ItemType Directory

Write-Output "Clearing existing resource pack folder."
if (Test-Path -Path .\resourcepacks) {
    Remove-Item .\resourcepacks -Force -Recurse -Confirm:$false
}
New-Item -Path .\resourcepacks -ItemType Directory

Write-Output "Downloading common mods..."
foreach($url in Get-Content .\common-mods.txt) {
    Write-Output "Downloading $url"
    $path = ".\mods\" + $(Split-Path -Path $url -Leaf)
    Invoke-WebRequest -Uri $url -OutFile $path
}
Write-Output ""

Write-Output "Downloading client mods..."
foreach($url in Get-Content .\client-mods.txt) {
    Write-Output "Downloading $url"
    $path = ".\mods\" + $(Split-Path -Path $url -Leaf)
    Invoke-WebRequest -Uri $url -OutFile $path
}
Write-Output ""

Write-Output "Downloading resource packs..."
foreach($url in Get-Content .\client-resourcepacks.txt) {
    Write-Output "Downloading $url"
    $path = ".\resourcepacks\" + $(Split-Path -Path $url -Leaf)
    Invoke-WebRequest -Uri $url -OutFile $path
}

