#
# Defines environment variables.
#
# Authors:
#   Justin Li <jli@j-li.net>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export ZDOTDIR="$HOME/.zsh"

export EDITOR=vim
export VISUAL=vim
export PAGER=less

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

typeset -gU cdpath fpath mailpath path

path=(
  "$HOME/bin"
  $path
)

export LESS='-g -i -M -R -S -w -z-4'

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

