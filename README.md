# DotDotDot
My dotfile and setup shell for mac 

## setup

```sh
make setup 
```

Install my favorite tool and setup my terminal environment


## setup only terminal

```sh
make terminal-setup
```

Setup my setting for...

 * neovim with dein
 * fish shell
 * tmux
 * peco
 * git
 * ideavim

## individual pc setting 

This dot file can divide environment for company pc, personal pc, lab pc.

```
root(~)
 |- .local_setting
    |- fish
       |- functions
          |- fish_fuction_you_use_only_the_pc.fish
          |- for_example_function_depend_on_the_pc.fish
          |- ...
          |- ...
          |- init
             |- fish_function_you_want_call_when_you_start_fish_shell.fish
             |- for_example_function_set_emvironmental_variable.fish
             |- ...
             |- ...
```

You create folders(.local_setting, fish, functions, init) as above.
You put function the folders.

[example](https://github.com/g-hyoga/dotfiles/blob/master/.local_setting)

