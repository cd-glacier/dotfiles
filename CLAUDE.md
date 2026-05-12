# dotfiles

## リポジトリ構成

ツール・環境ごとにディレクトリを分割し、それぞれに `bin/installer.sh` と設定ファイルを配置する構成。

| ディレクトリ | 用途 |
|---|---|
| `bash/` | bash 共通設定 |
| `nvim/` | Neovim 設定 |
| `mac/` | macOS 固有設定 |
| `termux/` | Termux (Android) 固有設定 |
| `claudecode/` | Claude Code 設定 |
| `mise/` | mise 設定 |
| `tools/` | 自作 CLI ツール |
| `wezterm/`, `ghostty/` | ターミナル設定 |
| `sketchybar/`, `yabai_skhd/`, `raycast/` | macOS UI ツール |

## .gitignore の方針

**ホワイトリスト方式**を採用。デフォルトで全ファイルを無視し、明示的に `!path` で許可したファイルのみ git 管理される。

- 新しいファイルを追加する際は必ず `.gitignore` にも `!path` を追記すること
- `git status` に出ないファイルは管理外になっているので注意

## Termux 環境について

macOS 向けの設定（`mac/`、`bash/`、各ツール）は Termux では使用しない。
Termux 固有の設定は **`termux/` ディレクトリに個別に用意する**。

- bash 設定: `termux/.bashrc`, `termux/.bash_profile`
- starship: `termux/.config/starship.toml`（Nerd Font 非使用版）
- nvim: `termux/.config/nvim/init.lua`
- tmux: `termux/.tmux.conf`
- パッケージインストール: `pkg` コマンド（`brew` は使わない）
- バイナリパス: `$PREFIX/bin`（`/data/data/com.termux/files/usr/bin`）
