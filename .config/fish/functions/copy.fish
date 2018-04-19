
set tmp_file /var/tmp/copytmpfile

function copy
  echo $argv > $tmp_file
  echo $argv copied
end

