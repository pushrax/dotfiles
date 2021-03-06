if [[ "$PROFILE_ZSH_STARTUP" == true ]]; then
	# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
	PS4=$'%D{%M%S%.} %N:%i> '
	exec 3>&2 2>$HOME/tmp/startlog.$$
	setopt xtrace prompt_subst
fi

fpath=(
  "$ZDOTDIR/functions"
  $fpath
)

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
else
  echo "Missing prezto!"
fi

source "$ZDOTDIR/z/z.sh"

# Prevent ESC from lagging
KEYTIMEOUT=1

# Make backspace work as with vim's "set backspace=2"
bindkey "^?" backward-delete-char
bindkey "^H" backward-delete-char
bindkey "^W" backward-kill-word

setopt nocorrectall


ID_RSA="$HOME/.ssh/id_rsa"
if [ -r "$ID_RSA" ] && (( $+commands[keychain] )); then
	eval `keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa`
fi

if [ -r "$HOME/.zlocal" ]; then
	source "$HOME/.zlocal"
fi

export GPG_TTY=`tty`

function notify {
	ret=$?
	if [ $ret -eq 0 ]; then
		echo -e "\033[1;32m[ DONE ]\033[0m"
		( say -v 'Good News' "Done" & )
	elif [ $status -ne 130 ]; then
		echo -e "\033[1;31m[ ERROR $ret ]\033[0m"
		( say -v Cellos "oh noes, exit code $ret" & )
	fi
	return $status
}

function ag-replace {
	ag "$1" --files-with-matches | xargs perl -pi -e "s/$1/$2/g"
}

function rg-replace {
	rg "$1" --files-with-matches | xargs perl -pi -e "s/$1/$2/g"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "$ZDOTDIR/aliases.zsh"

if [[ "$PROFILE_ZSH_STARTUP" == true ]]; then
	unsetopt xtrace
	exec 2>&3 3>&-
fi
