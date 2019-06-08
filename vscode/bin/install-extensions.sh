#!bin/bash

echo "##### install vscode extensions #####"

EXTENSIONS=(artdiniz.quitcontrol-vscode \
    castwide.solargraph \
    CoenraadS.bracket-pair-colorizer-2 \
    eamodio.gitlens \
    GabrielBB.vscode-lombok \
    GitHub.vscode-pull-request-github \
    humao.rest-client \
    ldcf4.jumpprotobuf \
    lovemo.swift-perfect \
    ms-vscode.Go \
    oderwat.indent-rainbow \
    PKief.material-icon-theme \
    rebornix.nova \
    rebornix.ruby \
    redhat.java \
    shardulm94.trailing-spaces \
    VisualStudioExptTeam.vscodeintellicode \
    vscjava.vscode-java-debug \
    vscjava.vscode-java-dependency \
    vscjava.vscode-java-pack \
    vscjava.vscode-java-test \
    vscjava.vscode-maven \
    vscodevim.vim \
)

for extension in ${EXTENSIONS[@]}; do \
    code --install-extension $extension; \
done
