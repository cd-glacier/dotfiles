
function pullstream
  echo "git fetch upstream"
  git fetch upstream
  echo "git rebase upstream/master"
  git rebase upstream/master
end
