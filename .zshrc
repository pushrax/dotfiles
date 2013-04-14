ZSH="$HOME/.zsh/oh-my-zsh"
ZSH_CUSTOM="$HOME/.zsh"

ZSH_THEME="pushrax"
plugins=(git ruby node brew nyan vi-mode history-substring-search)

export DISABLE_AUTO_UPDATE="true"
source "$ZSH/oh-my-zsh.sh"

export EDITOR=vim

# Prevent ESC from lagging
KEYTIMEOUT=1

# Make backspace work as with vim's "set backspace=2"
bindkey "^?" backward-delete-char
bindkey "^H" backward-delete-char
bindkey "^W" backward-kill-word

setopt nocorrectall

export PATH="$HOME/bin:$PATH"

ID_RSA="$HOME/.ssh/id_rsa"
if [ -r "$ID_RSA" ] && (( $+commands[keychain] )); then
	eval `keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa`
fi


if [ -r "$HOME/.zsh-env" ]; then
	source "$HOME/.zsh-env"
fi

