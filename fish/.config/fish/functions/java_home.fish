
function java_home
  # /usr/libexec/java_home -V
  set JAVA_HOME (/usr/libexec/java_home -v "$argv")
  set -x PATH $JAVA_HOME/bin $PATH
  echo $JAVA_HOME
end

