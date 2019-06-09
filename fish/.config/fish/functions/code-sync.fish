
function code-sync
    set TMP (PWD)
    cd $GOPATH/src/github.com/g-hyoga/dotfiles
    and \
        make code-sync
    and \
        git diff --color=always -- ./vscode/extensions.list
    and \
        cd $TMP
end