
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

for rc in $(ls ~/.config/custom_bashrc/); do
  . ~/.config/custom_bashrc/$rc
done

