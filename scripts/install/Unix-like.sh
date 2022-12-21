#!/bin/bash
set -eu
shopt -s dotglob
echo ::group::Installing $folder_name to tool cache
mkdir -p $RUNNER_TOOL_CACHE/$folder_name
mv $RUNNER_TEMP/$folder_name/* $RUNNER_TOOL_CACHE/$folder_name
echo ::endgroup::