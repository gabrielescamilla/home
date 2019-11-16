# If you come from bash you might have to change your $PATH.
export ANDROID_HOME=~/Android
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH="/usr/local/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="~/.home/.zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="crunch"
ZSH_THEME="agnoster"
DEFAULT_USER="gescamilla"
prompt_context(){}

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
CASE_SENSITIVE="true"

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
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
COMPLETION_WAITING_DOTS="true"

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
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias g="git "
alias gi="git "
alias co="checkout "
alias st="status"
alias gst="git status"
alias home="cd ~"
alias gpo="git pull origin "
alias gpullo="git pull origin "
alias gpusho="git push origin "
alias :q="exit"

# docker
alias de='docker exec -e COLUMNS="$(tput cols)" -e LINES="$(tput lines)" -ti'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.Command}}\t{{.Image}}"'

# Java management
source ~/.sdkman/bin/sdkman-init.sh


# do vim mode
bindkey -v
#bindkey '^P' up-history

# TMUXINATOR STUFF
# source ~/.bin/tmuxinator.zsh
# alias cmm='f(){ mux start cmm -n  "$@" workspace="$@";  unset -f f; }; f'
#
# alias -g L=" | less "
# alias cmdt='f(){ echo before "$@" after;  unset -f f; }; f'

#
#function zle-line-init zle-keymap-select {
#  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
#  zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select
#export KEYTIMEOUT=1
export PATH="/usr/local/bin:$PATH"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/Users/gescamilla/.sdkman"
#[[ -s "/Users/gescamilla/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/gescamilla/.sdkman/bin/sdkman-init.sh"
#
PROMPT='%{$fg[yellow]%}{%D{%M:%S}} '$PROMPT
#
# Ruby management
source '/usr/local/share/chruby/chruby.sh'
source '/usr/local/share/chruby/auto.sh'
RUBIES=(
  # other rubies here
  ~/.rubies/ruby-2.0.0-p645
  ~/.rubies/ruby-2.5.0
  ~/.rubies/ruby-2.2.4
  ~/.rubies/ruby-2.2.4
  ~/.rubies/ruby-2.3.7
)

chruby ruby-2.5.0
#
ssh-add -L &> /dev/null
if [ $? -eq 1 ]; then
  ssh-add
fi
#



# sets the tab title to current dir
# precmd() {
  #echo -ne "\e]1;${PWD##*/}\a"
#}
export PATH="/usr/local/opt/node@8/bin:$PATH"

# For the new vim in opt
PATH=/opt/local/bin:$PATH

# For platform dev shovel
shovel() ( cd ~/code/dev && ./script/run shovel "$@"; )