
function java_home
  if [ "$argv" != "" ]
    set selected_java_version "$argv"
  else
    set java_list '/tmp/java_home'

    /usr/libexec/java_home -V 2> /tmp/tmp
    tail -n+2 /tmp/tmp \
      | sed 's/^ *//g' \
      | sed 's/	/ /g' \
      | sed 's/,//g' \
      > "$java_list"

    set selected_java_version (cat "$java_list" | fzf | awk '{print $1}')
  end

  set JAVA_HOME (/usr/libexec/java_home -v "$selected_java_version")
  set -x PATH $JAVA_HOME/bin $PATH
  echo "change to $JAVA_HOME"
end

