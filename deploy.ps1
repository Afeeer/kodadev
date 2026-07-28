# Push Kodadev site (with showroom images) to GitHub Pages.
# Run from PowerShell after you are logged into GitHub (gh auth login or Git Credential Manager).

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$defaultRemote = "https://github.com/afeeer/afeeer.github.io.git"
$remote = if ($args.Count -gt 0) { $args[0] } else { $defaultRemote }

Write-Host "Kodadev deploy" -ForegroundColor Cyan
Write-Host "Remote: $remote"

if (-not (Test-Path "images\showroom\01-onboarding-who.png")) {
    Write-Error "Missing images/showroom/*.png — cannot deploy without showroom images."
}

$current = git remote get-url origin 2>$null
if (-not $current) {
    git remote add origin $remote
} elseif ($current -ne $remote) {
    Write-Host "Updating origin from $current to $remote"
    git remote set-url origin $remote
}

git branch -M main

$status = git status --porcelain
if ($status) {
    git -c user.name="Abena" -c user.email="afeeer@users.noreply.github.com" add -A
    git -c user.name="Abena" -c user.email="afeeer@users.noreply.github.com" commit -m "Update Koda journey site and showroom images."
}

Write-Host "Pushing to origin main..." -ForegroundColor Yellow
git push -u origin main

Write-Host ""
Write-Host "Done. In ~1 minute, check:" -ForegroundColor Green
Write-Host "  https://afeeer.github.io/"
Write-Host "  https://afeeer.github.io/images/showroom/01-onboarding-who.png"
