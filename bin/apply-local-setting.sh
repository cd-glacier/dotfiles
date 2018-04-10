#!bin/bash

LOCAL_SETTING_PATH=~/.local_setting

# fish setting
cd $LOCAL_SETTING_PATH/fish/functions
for function in *.fish; do
  echo $PWD/$function
  ln -sf $PWD/$function ~/.config/fish/functions/$function
done

cd $LOCAL_SETTING_PATH/fish/functions/init
touch call_local_functions.fish
for initFunc in *.fish; do
  echo $PWD/$initFunc
  ln -sf $PWD/$initFunc ~/.config/fish/functions/$intiFunc
  createInitFunc(${initFunc%.*})
done

function createInitFunc($func) {
  echo $func > call_local_functions.fish
}

