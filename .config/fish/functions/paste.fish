
set tmp_file /var/tmp/copytmpfile

function paste
  cat $tmp_file | read filename
  set dist (echo $filename | string split -r -m1 /)[2]
  cp $filename $argv$dist
  rm $tmp_file
  echo $dist paste
end
