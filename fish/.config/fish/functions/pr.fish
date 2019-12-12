
function pr
  set user_name (git config --get user.name)

  if $user_name == "g-hyoga"
    set domain "github.com"
  else
    set domain $GHE_DOMAIN
  end

  set repository (basename (git rev-parse --show-toplevel))

  open https://$domain/$user_name/$repository/pull/new/(git_branch)
end
