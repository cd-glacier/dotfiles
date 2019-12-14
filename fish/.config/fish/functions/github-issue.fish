
function issue
    set issueeee (hub issue | fzf | sed 's/   //g')
    set number (echo "$issueeee" | awk '{print $1}' | sed 's/#//g')

    echo "open $issueeee"

    hub browse -- "issues/$number"
end

