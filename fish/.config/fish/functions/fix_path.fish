
# PATH[1..5] /usr/local/bin /usr/bin /bin /usr/sbin /sbin
# decrease these path priority
function fix_path
  set tmp $PATH[1..5]
  set PATH $PATH[6..(count $PATH)]
  set PATH $PATH $tmp
end
