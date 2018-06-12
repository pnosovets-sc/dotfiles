#!/usr/bin/env bash

{ # This ensures the entire script is downloaded.  

function echoHeader {
  printf -- "\n\n--------------------------------------------"
  printf  "\n[INFO]  $1\n\n"
}

# Before install
echoHeader 'Install dependencies'
sudo apt-get update
sudo apt-get install -y git software-properties-common python-software-properties

# FZF
echoHeader 'Installling FZF'
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Ag 
echoHeader 'Installing Silver Searcher'
apt-get install silversearcher-ag

# Update VIM to v8
echoHeader 'Installing VIM8'
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install -y vim 

# Vundle
echoHeader 'Installing Vundle Vim plugin manager'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# .vimrc
echoHeader 'Creating .vimrc file'
curl -sL https://raw.githubusercontent.com/pnosovets-sc/dotfiles/master/.vimrc > ~/.vimrc

echoHeader 'Installing Vim plugins'
vim +slient +PluginInstall +qall </dev/tty

# .bashrc
echoHeader 'Updating .bashrc'
echo 'FZF_CTRL_T_COMMAND=`ag --hidden --ignore .git -g ""`' >> ~/.bashrc
echo 'FZF_DEFAULT_COMMAND=`ag --hidden --ignore .git -g ""`' >> ~/.bashrc
echo 'export FZF_DEFAULT_OPTS="
--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
--color info:183,prompt:110,spinner:107,pointer:167,marker:215
      --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
      "' >> ~/.bashrc


# Aliases
echoHeader 'Adding bash aliases'
curl -sL  https://raw.githubusercontent.com/pnosovets-sc/dotfiles/master/.bash_aliases >> ~/.bash_aliases

source ~/.bashrc

} # This ensures the entire script is downloaded.
