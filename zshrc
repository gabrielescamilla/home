[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PLATFORM_DEV="/Users/gescamilla/dev"
shovel() ( $PLATFORM_DEV/script/run shovel "$@"; )
alias de='docker exec -e COLUMNS="$(tput cols)" -e LINES="$(tput lines)" -ti'
alias dps='docker ps —format "table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.Command}}\t{{.Image}}"'
fpath=($PLATFORM_DEV/misc/completion/ $fpath)
 
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit
$HOME/.asdf/completions/asdf.bash

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  # ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

source ${ZDOTDIR:-$HOME}/.zprezto/init.zsh
 
# Enable vim mode
bindkey -v

# Aliases
alias rsync.exact="rsync -rtpogxv -P -l -H"
alias rsync.loose="rsync -zvru -P"
alias rgrep="grep -r"
alias vimconflicts='vim -p +/"<<<<<<<" $( git diff --name-only --diff-filter=U | uniq | xargs )'
alias -g g="| grep"
alias -g l="| less"
alias nnn="NNN_SHOW_HIDDEN=1 nnn -S"
alias df="pydf 2>/dev/null || df -h"
alias co="git checkout"

#fzf
[ -f $HOME/.home/zsh/.fzf.zsh ] && source $HOME/.fzf.zsh

