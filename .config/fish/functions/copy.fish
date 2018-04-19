
set tmp_file /var/tmp/copytmpfile

function copy
  echo (pwd)/$argv > $tmp_file
  echo $argv copied
end

