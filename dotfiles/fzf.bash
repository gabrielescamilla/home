# Setup fzf
# ---------
if [[ ! "$PATH" == *~/.home/submodules/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}~/.home/submodules/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "~/.home/submodules/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "~/.home/submodules/fzf/shell/key-bindings.bash"
