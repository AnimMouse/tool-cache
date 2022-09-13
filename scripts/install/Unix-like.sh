#!/bin/sh
set -eu
echo ::group::Installing $folder_name to tool cache
if ! [ -d $RUNNER_TOOL_CACHE/$folder_name/ ]; then
  mkdir $RUNNER_TOOL_CACHE/$folder_name/
fi
mv $RUNNER_TEMP/$folder_name/* $RUNNER_TOOL_CACHE/$folder_name/
echo ::endgroup::