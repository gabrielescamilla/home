# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.home/zsh/prezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.home/zsh/prezto/init.zsh"
fi

source $HOME/.home/zsh/.zshrc_common

# Vim Mode
bindkey -v

export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH"
