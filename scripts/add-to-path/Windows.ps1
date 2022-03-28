$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Adding $env:folder_name tool cache folder to path
Add-Content $env:GITHUB_PATH $env:RUNNER_TOOL_CACHE\$env:folder_name
Write-Host ::endgroup::