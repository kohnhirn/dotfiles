#!/bin/bash

DOTFILE_DIR="${${HOME}/dotfiles}"

[[ -d "${DOTFILE_DIR}" ]] && echo "${DOTFILE_DIR} already exists."; exit

cd "${HOME}"

TAR_URL="https://github.com/kohnhirn/dotfiles/archive/refs/heads/main.tar.gz"
curl -sSLO "${TAR_URL}" 
tar -zxvf main.tar.gz && rm main.tar.gz
mv -f dotfiles-main "{DOTFILE_DIR}"

function replace() {
    [[ ! -d "$HOME/.org" ]] && mkdir "$HOME/.org"
    cd ${HOME}
    dotfile_list=$(find "${HOME}"/dotfiles -maxdepth 1 -name ".*" -type f | xargs -I {} basename {})
    echo "${dotfile_list}" | xargs -I {} mv "${HOME}"/{} "${HOME}"/.org/ 
    echo "${dotfile_list}" | xargs -I {} ln -s "${HOME}"/dotfiles/{} "${HOME}"/{}
}

function install() {
    sudo apt install -y peco
    sudo apt list -y golang-go 
    go install github.com/x-motemen/ghq@latest
}

function configure() {
    git config --global core.editor vim
}

replace
install
configure

echo -e "To track changes in \"dotfiles\", clone the repository with the following command;\n$ ghq get https://github.com/kohnhirn/dotfiles.git"
