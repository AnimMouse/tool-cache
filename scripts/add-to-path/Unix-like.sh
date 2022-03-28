#!/bin/sh
set -eu
echo ::group::Adding $folder_name tool cache folder to path
echo $RUNNER_TOOL_CACHE/$folder_name >> $GITHUB_PATH
echo ::endgroup::