function gch
  git branch -a | fzf --reverse | tr -d ' ' | read branch
  echo $branch
  if [ $branch ]
      if contains $branch "remotes/"
          set -l b (echo $branch | awk -F'/' '{print $3}')
          git checkout -b $b $branch
      else
          git checkout $branch
      end
  end
  commandline -f repaint
end

