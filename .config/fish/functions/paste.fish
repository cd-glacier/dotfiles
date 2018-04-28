
set tmp_file /var/tmp/copytmpfile

function paste
  cat $tmp_file | read filename
  if test -d $filename
    set option -r
    # ディレクトリの最後の/を消してる
    set filename (string sub -s 1 -l (math (string length $filename) - 1) $filename)
  end
  set dist (echo $filename | string split -r -m1 /)[2]

  if count $argv == 0
    cp $option $filename .
  else 
    cp $option $filename (string join $argv $dist)
  end
  rm $tmp_file
  echo $dist paste
end
