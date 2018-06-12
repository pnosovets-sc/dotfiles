alias gb="git branch"
alias gu="git pull && git fetch --prune"
alias gp="git push && git push --tags"
alias gl="git branch -r | fzf"
alias gc="git checkout"



########

# FZF aliases

# fbr - checkout git branch (including remote branches)
fbr() {
   local branches branch
   branches=$(git branch --all | grep -v HEAD) && 
   branch=$(echo "$branches" | 
            fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) && 
   git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##") 
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}


fnpm() {
    local packages
    packages=$(all-the-package-names | fzf -m) &&
    echo "$packages" &&
    npm i $(echo $packages)
}

alias vimf='vim $(fzf)'
