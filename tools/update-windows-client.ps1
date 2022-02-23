Set-Location ..

git reset --hard
git clean -fd
git pull origin modlist-rework

./download-windows-client.ps1

