# Tool Cache in Composite Action
Implementation of [actions/tool-cache toolkit](https://github.com/actions/toolkit/tree/main/packages/tool-cache) in composite GitHub Actions.

A Tool Cache for composite-based GitHub Actions.

This action supports Ubuntu, Windows, and macOS.

## Rationale
The purpose of this action is to provide composite-based actions an easy way to install programs on GitHub Actions.

JavaScript-based actions already have [actions/tool-cache toolkit](https://github.com/actions/toolkit/tree/main/packages/tool-cache) to facilitate in installing programs in GitHub Actions.

With this tool cache action, you don't need to worry writing a code in installing the program and adding it to PATH, you just download the program and extract it to a folder inside runner temp, just like actions/tool-cache toolkit.

## Usage
1. Create a folder with the name of the program you want to install inside `${{ runner.temp }}`.
2. Extract all of the files required by the program to that folder inside `${{ runner.temp }}` you have created.
3. Run this action with the name of the folder inside `${{ runner.temp }}` you used to extract all the files needed for the program.

### Example workflow
```yaml
steps:
  - name: Download Hello World binary (Unix-like)
    if: runner.os == 'Linux' || runner.os == 'macOS'
    working-directory: ${{ runner.temp }}
    run: |
      if [ $RUNNER_OS = macOS ]; then os=macos; else os=linux; fi
      mkdir hello-world
      wget -O hello-world/hello $GITHUB_SERVER_URL/AnimMouse/Hello-World-Binaries/raw/main/hello-$os
      chmod +x hello-world/hello
      
  - name: Download Hello World binary (Windows)
    if: runner.os == 'Windows'
    working-directory: ${{ runner.temp }}
    run: |
      New-Item hello-world -ItemType Directory
      Invoke-WebRequest $env:GITHUB_SERVER_URL/AnimMouse/Hello-World-Binaries/raw/main/hh2.golden.exe -OutFile hello-world\hello.exe
      
  - name: Install the Hello World binary using tool-cache
    uses: AnimMouse/tool-cache@v1
    with:
      folder_name: hello-world-program
```

### Example workflow with cache
```yaml
steps:
  - name: Restore Hello World cache
    id: cache
    uses: actions/cache/restore@v3
    with:
      path: ${{ runner.tool_cache }}/hello-world
      key: hello-world-${{ runner.os }}
      
  - name: Download Hello World binary (Unix-like)
    if: (runner.os == 'Linux' || runner.os == 'macOS') && ! steps.cache.outputs.cache-hit
    working-directory: ${{ runner.temp }}
    run: |
      if [ $RUNNER_OS = macOS ]; then os=macos; else os=linux; fi
      mkdir hello-world
      wget -O hello-world/hello $GITHUB_SERVER_URL/AnimMouse/Hello-World-Binaries/raw/main/hello-$os
      chmod +x hello-world/hello
      
  - name: Download Hello World binary (Windows)
    if: runner.os == 'Windows' && ! steps.cache.outputs.cache-hit
    working-directory: ${{ runner.temp }}
    run: |
      New-Item hello-world -ItemType Directory
      Invoke-WebRequest $env:GITHUB_SERVER_URL/AnimMouse/Hello-World-Binaries/raw/main/hh2.golden.exe -OutFile hello-world\hello.exe
      
  - name: Install the Hello World binary using tool-cache
    uses: AnimMouse/tool-cache@v1
    with:
      folder_name: hello-world-program
      cache_hit: ${{ steps.cache.outputs.cache-hit }}
      
  - name: Save Hello World cache
    if: '! steps.cache.outputs.cache-hit'
    uses: actions/cache/save@v3
    with:
      path: ${{ runner.tool_cache }}/hello-world
      key: hello-world-${{ runner.os }}
```

You can check the .github/workflows/test.yaml file inside this repository to see how it works by installing a Hello World program.\
You can also check actions that uses this tool cache.

### Used by
1. [AnimMouse/setup-rclone](https://github.com/AnimMouse/setup-rclone)
2. [AnimMouse/setup-cloudflared](https://github.com/AnimMouse/setup-cloudflared)
3. [AnimMouse/setup-yt-dlp](https://github.com/AnimMouse/setup-yt-dlp)
4. [AnimMouse/setup-restic](https://github.com/AnimMouse/setup-restic)
5. [AnimMouse/setup-youtubeuploader](https://github.com/AnimMouse/setup-youtubeuploader)
6. [AnimMouse/setup-appimage](https://github.com/AnimMouse/setup-appimage)
7. [AnimMouse/setup-ffmpeg](https://github.com/AnimMouse/setup-ffmpeg)
8. [AnimMouse/setup-age](https://github.com/AnimMouse/setup-age)

### Similar actions
1. [supplypike/setup-bin](https://github.com/supplypike/setup-bin)
2. [pbrisbin/setup-tool-action](https://github.com/pbrisbin/setup-tool-action)
3. [jcwillox/install-tool-action](https://github.com/jcwillox/install-tool-action)
4. [prantlf/install-release-action](https://github.com/prantlf/install-release-action)