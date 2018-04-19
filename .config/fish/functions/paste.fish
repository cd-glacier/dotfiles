
set tmp_file /var/tmp/copytmpfile

function paste
  cat $tmp_file | read filename
  set dist (echo $filename | string split -r -m1 /)[2]
  if count $argv == 0
    cp $filename $dist
  else 
    cp $filename (string join $argv $dist)
  end
  rm $tmp_file
  echo $dist paste
end
