Write-Host "::group::Installing to tool cache"
New-Item "$env:RUNNER_TOOL_CACHE\$env:folder_name\" -ItemType Directory
Move-Item "$env:RUNNER_TEMP\$env:folder_name\*" "$env:RUNNER_TOOL_CACHE\$env:folder_name\"
Write-Host "::endgroup::"