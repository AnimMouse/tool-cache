#!/bin/sh
echo ::group::Adding tool cache to path
echo $RUNNER_TOOL_CACHE/$folder_name >> $GITHUB_PATH
echo ::endgroup::