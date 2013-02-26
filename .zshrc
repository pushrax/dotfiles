ZSH="$HOME/.zsh/oh-my-zsh"
ZSH_CUSTOM="$HOME/.zsh"

ZSH_THEME="j1i"
plugins=(git ruby)

export DISABLE_AUTO_UPDATE="true"

source "$ZSH/oh-my-zsh.sh"

export EDITOR=vim
setopt nocorrectall

if [ -r "$HOME/.zsh-env" ]
then
	source "$HOME/.zsh-env"
fi

export PATH="$HOME/bin:$PATH"

