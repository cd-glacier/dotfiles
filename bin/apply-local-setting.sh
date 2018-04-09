#!bin/bash

LOCAL_SETTING_PATH=~/.local_setting

# fish setting
cd $LOCAL_SETTING_PATH/fish/functions
for function in *.fish; do
  echo $PWD/$function
  ln -sf $PWD/$function ~/.config/fish/functions/$function
done

cd $LOCAL_SETTING_PATH/fish/functions/init
for initFunc in *.fish; do
  echo $PWD/$initFunc
  ln -sf $PWD/$initFunc ~/.config/fish/functions/$intiFunc
  echo ${initFunc%.*} >> ~/.config/fish/config.fish
done
