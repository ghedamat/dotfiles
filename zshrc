# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="simple"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rbenv rails3 autojump)

source $ZSH/oh-my-zsh.sh
unsetopt share_history # NOT share command history data
unsetopt correct_all # NOT share command history data



# Customize to your needs...






#export TERM=xterm-256color
#source '/etc/profile'
#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/$HOME/~}\007"'
#PS1=$PS1'$(parse_git_branch "%s")'




export PATH=/usr/local/bin:$PATH
export PATH=$PATH:~/bin

#source '/usr/local/lib/rvm'
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
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
