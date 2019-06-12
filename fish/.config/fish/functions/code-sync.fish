
function code-sync
    set TMP (PWD)
    cd $GOPATH/src/github.com/g-hyoga/dotfiles
    and \
        make code-sync-extensions
    and \
        cd $TMP
end
