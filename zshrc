#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

/Users/tha/Gentoo/startprefix
eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#export PATH="$HOME/.rbenv/bin:$PATH"

unsetopt share_history # NOT share command history data
unsetopt correct_all # NOT share command history data



# Customize to your needs...






export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color
#source '/etc/profile'
#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/$HOME/~}\007"'
#PS1=$PS1'$(parse_git_branch "%s")'




export PATH=/usr/local/bin:$PATH
export PATH=$PATH:~/bin
export PATH=$PATH:/home/tha/Dev/GO/bin
export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/bin/vim
export GOPATH=/home/tha/Dev/GO

#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
unset RUBYOPT
export VIMCLOJURE_SERVER_JAR="$HOME/lib/vimclojure/server-2.3.6.jar"
alias e="emacs -nw"
alias emacs="emacs -nw"



# tmux stuff
alias t="tmuxinator"
alias ts="tmuxinator s"
alias tu="tmuxinator ungc"
alias tl="tmuxinator lb"

alias gt="git-commit -t"
alias gp="git-commit -p"
alias gc="git-commit -c"


export EDITOR=vim


alias vi='nvim'
alias vim='nvim'

# utils
alias today='git log --committer="ghedamat" --since="6am" --format=%s'

stty stop undef
stty start undef
setopt noflowcontrol

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH="/usr/local/heroku/bin:$PATH"


case $TERM in
  screen*)
    precmd(){
      # Restore tmux-title to 'zsh'
      printf "\033kzsh\033\\"
      # Restore urxvt-title to 'zsh'
      print -Pn "\e]2;zsh:%~\a"
    }
    preexec(){
      # set tmux-title to running program
      printf "\033k$(echo "$1" | cut -d" " -f1)\033\\"
      # set urxvt-title to running program
      print -Pn "\e]2;zsh:$(echo "$1" | cut -d" " -f1)\a"
                }
    ;;
esac

alias browserstack="/home/tha/node_modules/browserstack-cli/bin/cli.js"
alias nombom='npm cache clear && bower cache clean && rm -rf node_modules bower_components && npm install && bower install'



export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/node_modules/.bin"
export LANG=en_US.UTF-8

source /Users/tha/Gentoo/etc/profile.d/autojump.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
