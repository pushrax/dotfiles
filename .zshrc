ZSH="$HOME/.zsh/oh-my-zsh"
ZSH_CUSTOM="$HOME/.zsh"

ZSH_THEME="pushrax"
plugins=(git ruby node brew nyan)

export DISABLE_AUTO_UPDATE="true"
source "$ZSH/oh-my-zsh.sh"

export EDITOR=vim
bindkey -v

vim_ins_mode="%B%F{green}-INS-"
vim_cmd_mode="%B%F{blue}[CMD]"
vim_mode=$vim_ins_mode

function zle-keymap-select {
	vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
	zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
	vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

RPROMPT='${vim_mode}'

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

