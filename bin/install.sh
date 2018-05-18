#!bin/bash

if [ $(uname) == "Linux" ]; then
  cd $(PWD)/ubuntu && make init
else 
  cd $(PWD)/mac && make init
fi


