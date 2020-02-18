#!/usr/bin/env bash
set -Ceuo pipefail

CURRENT=$( cd $(dirname $0);pwd )

ls -F ${CURRENT}/dotfiles | fgrep -v / | while read file
do 
    ln -s ${CURRENT}/dotfiles/${file} ~/.${file}
done

# git
ls -F ${CURRENT}/dotfiles/git | fgrep -v / | while read file
do 
    ln -s ${CURRENT}/dotfiles/git/${file} ~/.${file}
done

# functions
ln -s ${CURRENT}/functions/zshrc.functions ~/.zshrc.functions
[[ ! -d ~/bin/ ]] && mkdir ~/bin
ln -s ${CURRENT}/functions/git-sync.sh ~/bin/git-sync.sh

# n_sync
NSYNC=~/src/n_sync
[[ ! -s ${NSYNC}/clasprc.json ]] && ln -s ${NSYNC}/.clasprc.json ~/clasprc.json
[[ ! -d ${NSYNC}/aws ]] && ln -s ${NSYNC}/aws ~/.aws
[[ ! -d ${NSYNC}/ssh ]] && ln -s ${NSYNC}/ssh ~/.ssh

# karabinar
## TODO

# prezto
## TODO

# SublimeText
## TODO

# VScode
## TODO
ln -s ~/src/n_sync/vscode ~/.vscode

# athenacli
ln -s ~/src/n_sync/athenaclirc ~/.athenacli/athenaclirc
