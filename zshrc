#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH="$HOME/.rbenv/bin:$PATH"

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
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

#source '/usr/local/lib/rvm'
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
unset RUBYOPT
export VIMCLOJURE_SERVER_JAR="$HOME/lib/vimclojure/server-2.3.6.jar"
alias e="emacs -nw"
alias emacs="emacs -nw"



# tmux stuff
alias tw="tmux new -s work"
alias twa="tmux attach -t work"
alias tp="tmux new -s personal"
alias tpa="tmux attach -t personal"


export EDITOR=vim

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias v='f -e vim' # quick opening files with vim

stty stop undef
stty start undef
setopt noflowcontrol
