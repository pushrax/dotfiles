ZSH="$HOME/.zsh/oh-my-zsh"
ZSH_CUSTOM="$HOME/.zsh"

ZSH_THEME="blinks"
plugins=(git ruby)

source "$ZSH/oh-my-zsh.sh"

export EDITOR=vim
setopt nocorrectall

if [ -r "$HOME/.zsh-profile" ]
then
	source "$HOME/.zsh-profile"
fi

