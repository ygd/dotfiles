# Lines configure by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
bindkey '^R' history-incremental-search-backward

export KEYTIMEOUT=1
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/ygd/.zshrc'

if which exenv > /dev/null; then eval "$(exenv init -)"; fi

export NVM_DIR=~/.nvm
  . $(brew --prefix nvm)/nvm.sh

autoload -Uz compinit
compinit
# End of lines added by compinstall

# colors
autoload -U colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export CLICOLOR=1

# prompt
setopt prompt_subst
setopt prompt_percent
autoload -U promptinit
promptinit

source /usr/local/etc/bash_completion.d/git-prompt.sh
precmd () { __git_ps1 "%{$fg_bold[cyan]%}%~%{$reset_color%} " "%# " "(%s) " }
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1

export PATH=/usr/local/bin:$PATH

alias ez="vim ~/repos/dotfiles/zshrc"
alias sz="source ~/.zshrc"

alias shf='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hhf='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias rake='noglob rake'

alias v="vim"

alias g='git status -u'
alias gb='git branch -a'
alias gbd='git branch -D'
alias gpl='git pull'
alias gp='git push'
alias ga='git add'
alias gap='git add --patch'
alias gaa='git add -A'
alias gs='git stash'
alias gsa='git stash apply'
alias gsc='git stash clear'
alias gd='git diff'
alias gl="git log --oneline --graph --decorate --date=relative"
alias gc='git commit --verbose'
alias gca='git commit -a'
alias gcamend='git commit --amend'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcob='git checkout -b'
alias gmm='git merge master'
alias gpuo='git push -u origin'
alias gpfwl='git push --force-with-lease'
alias grpo='git remote prune origin'

alias b='bundle'
alias bu='bundle update'
alias ber='bundle exec rake'
alias beg='bundle exec guard'

alias jb='jekyll build'
alias jbp='JEKYLL_ENV=production jekyll build'
alias js='jekyll serve'
alias jsp='JEKYLL_ENV=production jekyll serve'
alias js2='jekyll serve --limit_posts=2'

alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dc='docker-compose'
alias dcp='docker-compose pull'
alias dcb='docker-compose build'
alias dcbnc='docker-compose build --no-cache'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcd='docker-compose down'
alias dcs='docker-compose stop'
alias dcl='docker-compose logs -f'
alias deit='docker exec -it'

alias c='clear'
alias ll='ls -lapG'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

function f() { cd $(find ~/repos -maxdepth 2 -type d | selecta) }

eval export PATH="/Users/ygd/.rbenv/shims:${PATH}"

[[ -s "$PATH/.gvm/scripts/gvm" ]] && source "$PATH/.gvm/scripts/gvm"

rbenv rehash 2>/dev/null
rbenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval `rbenv "sh-$command" "$@"`;;
  *)
    command rbenv "$command" "$@";;
  esac
}

[[ -s "/Users/ygd/.gvm/scripts/gvm" ]] && source "/Users/ygd/.gvm/scripts/gvm"
