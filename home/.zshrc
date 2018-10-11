# Path to your oh-my-zsh installation.
export ZSH=/home/ghedamat/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fwalch"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump rbenv)

source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
#NPM_GLOBAL="$HOME/.npm-global"
#npm config set prefix "$NPM_GLOBAL"


stty stop undef
stty start undef
setopt noflowcontrol

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



PERL_MB_OPT="--install_base \"/Users/ghedamat/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/ghedamat/perl5"; export PERL_MM_OPT;

export LANG=en_US.UTF-8
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:~/bin
export PATH=$PATH:/Users/ghedamat/Dev/GO/bin
export PATH="$PATH:$NPM_GLOBAL/bin"
export PATH="$PATH:/Users/ghedamat/Dev/APPCANARY/datomic-pro-0.9.5173/bin"
export PATH="$PATH:/Users/ghedamat/Dev/GO/go/bin"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/.npm-global/bin"
export PATH="~/.ansible-env/bin:$PATH"
export VISUAL=/usr/bin/vim
export GOPATH=/Users/ghedamat/Dev/GO
export EDITOR=vim
export VIMCLOJURE_SERVER_JAR="$HOME/lib/vimclojure/server-2.3.6.jar"

alias t="tmuxinator"
alias ts="tmuxinator s"
alias tu="tmuxinator ungc"
alias tl="tmuxinator lb"
alias gt="git-commit -t"
alias gp="git-commit -p"
alias gc="git-commit -c"
alias vi='vim'
alias emacs='emacs -nw'
alias today='git log --committer="ghedamat" --since="6am" --format=%s'
alias nombom='npm cache clear && bower cache clean && rm -rf node_modules bower_components && npm install && bower install'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="/home/ghedamat/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$HOSTNAME.sock

ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
  echo "started"
  ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi
