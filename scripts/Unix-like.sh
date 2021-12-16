#!/bin/sh
echo "::group::Installing to tool cache"
mkdir "$RUNNER_TOOL_CACHE/$folder_name/"
mv "$RUNNER_TEMP/$folder_name/"* "$RUNNER_TOOL_CACHE/$folder_name/"
echo "::endgroup::"