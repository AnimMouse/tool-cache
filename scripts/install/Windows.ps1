$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Installing $env:folder_name to tool cache

#
# Remove cache path to avoid "file already exists" error on self-hosted runners that are not disposable
#
# Installing Rclone to tool cache
#      Directory: C:\actions-runner\_work\_tool
#  Mode                 LastWriteTime         Length Name                                                                 
#  ----                 -------------         ------ ----                                                                 
#  d-----         3/23/2023  11:35 AM                Rclone                                                               
#  Move-Item : Cannot create a file when that file already exists.
#  At C:\actions-runner\_work\_actions\AnimMouse\tool-cache\v1\scripts\install\Windows.ps1:5 char:1
#
$runnerCachePath = $env:RUNNER_TOOL_CACHE
$folderName = $env:folder_name
$cachePath = "${runnerCachePath}\${folderName}"
Write-Output "Cache path: ${cachePath}"
if(Test-Path $cachePath) {
  Remove-Item -Recurse -Force $cachePath
}

New-Item $cachePath -ItemType Directory -Force
Move-Item $env:RUNNER_TEMP\$env:folder_name\* $cachePath
Write-Host ::endgroup::
