Set-Location ..

git reset --hard
git clean -fd
git pull origin main

./download-windows-client.ps1

