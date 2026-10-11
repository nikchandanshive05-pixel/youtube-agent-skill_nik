# install.ps1 - Install YouTube Agent skills for Google Antigravity on Windows
$ErrorActionPreference = "Stop"

Write-Host "Installing YouTube Agent skills for Google Antigravity..." -ForegroundColor Cyan

$pluginDir = Join-Path $HOME ".gemini\config\plugins\youtube-agent"
$voiceDir  = Join-Path $HOME ".gemini\youtube"
$voiceFile = Join-Path $voiceDir "voice.md"

# 1. Create plugin directory
if (-not (Test-Path $pluginDir)) {
    New-Item -ItemType Directory -Force -Path $pluginDir | Out-Null
}

# 2. Copy plugin assets
$sourceDir = $PSScriptRoot
Copy-Item -Path (Join-Path $sourceDir "plugin.json") -Destination $pluginDir -Force
Copy-Item -Path (Join-Path $sourceDir "README.md") -Destination $pluginDir -Force
Copy-Item -Path (Join-Path $sourceDir "LICENSE") -Destination $pluginDir -Force
Copy-Item -Path (Join-Path $sourceDir "skills") -Destination $pluginDir -Recurse -Force
Copy-Item -Path (Join-Path $sourceDir "templates") -Destination $pluginDir -Recurse -Force

if (Test-Path (Join-Path $sourceDir "rules")) {
    Copy-Item -Path (Join-Path $sourceDir "rules") -Destination $pluginDir -Recurse -Force
}

Write-Host "Plugin installed to: $pluginDir" -ForegroundColor Green

# 3. Setup voice profile template if not present
if (-not (Test-Path $voiceDir)) {
    New-Item -ItemType Directory -Force -Path $voiceDir | Out-Null
}

if (-not (Test-Path $voiceFile)) {
    Copy-Item -Path (Join-Path $sourceDir "templates\voice.md") -Destination $voiceFile -Force
    Write-Host "Created initial voice profile at: $voiceFile" -ForegroundColor Yellow
} else {
    Write-Host "Found existing voice profile at: $voiceFile" -ForegroundColor Gray
}

Write-Host ""
Write-Host "Installation complete! Restart Antigravity to activate the plugin." -ForegroundColor Cyan
Write-Host "Available skills in Antigravity: /yt-script, /yt-package, /yt-edit, /yt-retention, /yt-shorts, /yt-viral, /yt-plan, /yt-seo, /yt-chapters, /yt-comment, /yt-audit" -ForegroundColor White
