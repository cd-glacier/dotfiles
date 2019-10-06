function re
  set last_command (history | head -n 1)

  function iter
    set last_command "$argv[1]"

    if [ "$last_command" = "re" ]
      set last_command (history | head -n 2 | tail -n 1)
      iter "$last_command"
    else
      echo "run: $last_command"
      eval $last_command
    end
  end

  iter "$last_command"
end
