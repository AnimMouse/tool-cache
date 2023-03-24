$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Installing $env:folder_name to tool cache
New-Item $env:RUNNER_TOOL_CACHE\$env:folder_name\ -ItemType Directory -Force
Move-Item $env:RUNNER_TEMP\$env:folder_name\* $env:RUNNER_TOOL_CACHE\$env:folder_name -Force
Write-Host ::endgroup::