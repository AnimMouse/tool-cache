# Tool Cache in Composite Action
Implementation of [actions/tool-cache toolkit](https://github.com/actions/toolkit/tree/main/packages/tool-cache) in composite GitHub Actions.

A Tool Cache for composite-based GitHub Actions.

This action supports Ubuntu, Windows, and macOS.

## Purpose
The purpose of this action is to provide composite-based actions an easy way to install programs on GitHub Actions.

JavaScript-based actions already have [actions/tool-cache toolkit](https://github.com/actions/toolkit/tree/main/packages/tool-cache) to facilitate in installing programs in GitHub Actions.

With this tool cache action, you don't need to worry writing a code in installing the program and adding it to PATH, you just download the program and extract it to a folder inside runner temp, just like actions/tool-cache toolkit.

## Usage
1. Create a folder with the name of the program you want to install inside `${{ runner.temp }}`.
2. Extract all of the files required by the program to that folder you have created.
3. Run this action with the name of the folder you used to extract all the files needed for the program.

```yml
steps:
  - name: Install the Hello World binary using tool-cache
    uses: AnimMouse/tool-cache@v1
    with:
      folder_name: hello-world-program
```

You can check the .github/workflows/test.yml file inside this repository to see how it works by installing a Hello World program.\
You can also check actions that uses this tool cache.

### Used by
1. [AnimMouse/setup-rclone](https://github.com/AnimMouse/setup-rclone)
2. [AnimMouse/setup-cloudflared](https://github.com/AnimMouse/setup-cloudflared)

### Similar actions
1. [supplypike/setup-bin](https://github.com/supplypike/setup-bin)