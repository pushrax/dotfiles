bindkey -v

ZSH="$HOME/.zsh/oh-my-zsh"
ZSH_CUSTOM="$HOME/.zsh"

ZSH_THEME="pushrax"
plugins=(git ruby node github brew nyan)

export DISABLE_AUTO_UPDATE="true"

source "$ZSH/oh-my-zsh.sh"

export EDITOR=vim
setopt nocorrectall

export PATH="$HOME/bin:$PATH"

function command_exists() {
	hash "$1" &> /dev/null
}


ID_RSA="$HOME/.ssh/id_rsa"
if [ -r "$ID_RSA" ]; then
	eval `keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa`
fi


if [ -r "$HOME/.zsh-env" ]; then
	source "$HOME/.zsh-env"
fi

