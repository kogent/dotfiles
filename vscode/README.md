# vscode config

## extensions

### install extensions

```bash
./install_extesions.sh
```

### save current extensions

```bash
code --list extensions > vscode-extensions.list
```

## TODO: settings.json

auto install `settings.json` to correct path.
|os|path|
|--|----|
|macOS|`"${HOME}/Library/Application Support/Code/User/settings.json"`|
|Linux|`${HOME}/.config/Code/User/settings.json`|
|Windows|`%APPDATA%\Code\User\settings.json`|
