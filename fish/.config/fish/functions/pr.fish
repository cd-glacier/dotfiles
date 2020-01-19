
function pr
  set option $argv

  if [ "$option" = "create" ]
    set user_name (git config --get user.name)

    if [ $user_name = "g-hyoga" ]
      set domain "github.com"
    else
      set domain $GHE_DOMAIN
    end

    set repository (basename (git rev-parse --show-toplevel))

    open https://$domain/$user_name/$repository/pull/new/(git_branch)

  else
    set tmp (hub pr list | fzf);
      and set pullrequest (echo $tmp | sed 's/   //g');
      and set number (echo "$pullrequest" | awk '{print $1}' | sed 's/#//g');
      and echo "open $pullrequest";
      and hub browse -- "pull/$number";
      or echo ""
  end
end
