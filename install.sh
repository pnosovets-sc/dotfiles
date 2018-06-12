#!/usr/bin/env bash

{ # This ensures the entire script is downloaded.  

# Before install
echo "[INFO] Update dependencies"
sudo apt-get update
sudo apt-get install -y git

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Ag 
apt-get install silversearcher-ag

# Update VIM to v8
echo "[INFO] Installing Vim8"
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install -y vim 

# Vundle
echo "[INFO] Installing Vundle plugin manager"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# .vimrc
echo "[INFO] Create .vimrc file"
git@github.com:pnosovets-sc/dotfiles.git
https://raw.githubusercontent.com/pnosovets-sc/dotfiles/master/.vimrc > ~/.vimrc

echo "[INFO] Install Vim plugins"
vim +PluginInstall +qall

# .bashrc
echo 'FZF_CTRL_T_COMMAND=ag --hidden --ignore .git -g ""' >> ~/.bashrc
echo 'FZF_DEFAULT_COMMAND=ag --hidden --ignore .git -g ""' >> ~/.bashrc
echo '[ -f ~/.fzf.bash ] && source ~/.fzf.bash' >> ~/.bashrc

echo 'export FZF_DEFAULT_OPTS="
--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
--color info:183,prompt:110,spinner:107,pointer:167,marker:215
      --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
      "' >> ~/.bashrc


# Aliases
https://raw.githubusercontent.com/pnosovets-sc/dotfiles/master/.bash_aliases >> ~/.bash_aliases

} # This ensures the entire script is downloaded.
