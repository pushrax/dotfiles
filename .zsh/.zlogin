#
# Executes commands at login post-zshrc.
#
# Authors:
#   Justin Li <jli@j-li.net>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

