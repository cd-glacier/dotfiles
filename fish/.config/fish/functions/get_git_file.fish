# index 1: staging file?
# index 2: git status
# index 3: file name
# index 4: file name before rename
function get_git_file
  set s (string split " " $argv)
  set file_status $s[1]
  set file_name $s[2]

  if [ (string length $file_status) = 1 ]
    set file_status $s[1]
    set file_name $s[3]
  else if [ "$file_name" = "D" -o "$file_name" = "M" ]
    set file_status $s[2]
    set file_name $s[3]
  end

  switch $file_status
  case "A"
    echo "true $file_status $file_name"
  case "M"
    echo "true $file_status $file_name"
  case "R"
    echo "true $file_status $s[5] $file_name"
  case "D"
    echo "true $file_status $file_name"
  case "AM"
    echo "false $file_status $file_name"
  case "RM"
    echo "false $file_status $s[4] $file_name"
  case "??"
    echo "false $file_status $file_name"
  case "*"
    echo "unkown status: $file_status"
  end
end
