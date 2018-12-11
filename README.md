# DotDotDot...

setup for...

 * neovim
 * fish
 * tmux
 * mac apps
 * git env

## setup

```sh
make init
```

## setup only neovim

```sh
make nvim
```

## setup only fish 

```sh
make fish
```

## help

```sh
make help
```

## このdotfilesを参考にする人がいた時のTips

* 設定が必要なものごとにdirectoryを分けて独立性を高めている e.g. nvim, fish  
    nvimだけ設定し直したい時とかがあるので
* 設定ファイルはここにgit管理してリンクをはる [exmaple](https://github.com/g-hyoga/dotfiles/blob/e14b07e12f73f4aff3f1c9922ae11fed30982ba2/nvim/bin/init.sh#L32)
* 設定ファイル内で設定ファイルのパスを参照する時はリンク先を参照するようにする [example](https://github.com/g-hyoga/dotfiles/blob/e14b07e12f73f4aff3f1c9922ae11fed30982ba2/nvim/.config/nvim/init.vim#L155)
* [.gitignore](https://github.com/g-hyoga/dotfiles/blob/master/.gitignore)をホワイトリスト方式にする  
    cacheとかいらないものがdotfileには入りがちなので
* 以下のような文法を駆使してすでにinstallされているものはreinstallしないようにする

```bash
# nvimコマンドがなければ
if test -z $(wihch nvim); then
  # do anything
fi

# .configディレクトリがなければ
if ! test -d .config; then
  # do anything
di
```
