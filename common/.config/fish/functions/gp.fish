function gp
  echo git push origin (git_branch)
  if [ (git_branch) = "master" ]
   read --prompt="echo 'Your branch is master. push origin master? (Y/n):'" yn
   if [ $yn = "Y" ]
    git push origin (git_branch)
   end
  else
    git push origin (git_branch)
  end
end
