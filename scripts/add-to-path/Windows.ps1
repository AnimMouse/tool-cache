Write-Host ::group::Adding tool cache to path
Add-Content $env:GITHUB_PATH $env:RUNNER_TOOL_CACHE\$env:folder_name
Write-Host ::endgroup::