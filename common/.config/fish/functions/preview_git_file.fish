function preview_git_file
  set file (string split " " (get_git_file $argv))
  set file_status $file[2]
  set file_name $file[3]

  switch $file_status
  case "A"
    git diff --cached --color=always $file_name
  case "M"
    git diff --cached --color=always $file_name
    git diff --color=always $file_name
  case "R"
    echo "Rename file"
    echo "$file_name"
    echo "-> $file[4]"
  case "D"
    echo "Delete file"
  case "AM"
    git diff --color=always $file_name
  case "RM"
    echo "Rename file"
    echo "$file_name"
    echo "-> $file[4]"
  case "??"
    git add $file_name
    git diff --cached --color=always $file_name
    git reset $file_name >/dev/null
  case "*"
    echo "unknown status: $file_status"
    echo "$file_name"
  end
end
