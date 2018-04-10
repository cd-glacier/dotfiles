#!bin/bash

LOCAL_SETTING_PATH=~/.local_setting

function createInitFunc() {
  initFuncName=call_local_functions.fish
  echo "" > $initFuncName

  echo "# This function is auto created" >> $initFuncName
  echo "# Please look at github.com/g-hyoga/dotfiles" >> $initFuncName
  echo " " >> $initFuncName

  echo "function call_local_functions" >> $initFuncName
  for funcName in ${funcs[@]}; do
    echo "  $funcName" >> $initFuncName 
  done
  echo "end" >> $initFuncName
}

function linkFunc() {
  ln -sf $PWD/$1 ~/.config/fish/functions/$1
}

# fish setting
cd $LOCAL_SETTING_PATH/fish/functions
for function in *.fish; do
  echo linking... $PWD/$function
  linkFunc $function
done

cd $LOCAL_SETTING_PATH/fish/functions/init
touch call_local_functions.fish
funcs=()
for initFunc in *.fish; do
  echo linking... $PWD/$initFunc
  linkFunc $initFunc
  if [ ! $initFunc = "call_local_functions.fish" ]; then
    funcs+=( ${initFunc%.*} )
  fi
done
createInitFunc $funcs

