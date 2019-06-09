# DotDotDot...

setup for...

 * neovim
 * vscode
 * fish
 * tmux
 * mac apps
 * gitignore-global
 * gitconfig
 * ~rc files

## Setup

```sh
make init
```

## Setup only vscode

### Sync settings

sync
* settings.json
* keybindings.json
* extensions

```sh
make code
```

### Refresh extentions

```
make code-sync-extensions
```

## Setup only neovim

```sh
make nvim
```

## Setup only fish

```sh
make fish
```

...

## Make slack to dark

```sh
make darker-slack
```

This command do not have idempotency.
Restart slack after running this command.

## Help

```sh
make help
```

