
function pr
  set option $argv

  if [ "$option" = "create" ]
    set user_name (git config --get user.name)

    if [ $user_name -eq "g-hyoga" ]
      set domain "github.com"
    else
      set domain $GHE_DOMAIN
    end

    set repository (basename (git rev-parse --show-toplevel))

    open https://$domain/$user_name/$repository/pull/new/(git_branch)

  else
    set pullrequest (hub pr list | fzf | sed 's/   //g')
    set number (echo "$pullrequest" | awk '{print $1}' | sed 's/#//g')

    echo "open $pullrequest"

    hub browse -- "pull/$number"
  end
end
