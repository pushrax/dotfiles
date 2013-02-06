# https://github.com/j1i zsh theme, based on https://github.com/blinks original

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo ' ' #"%{%F{blue}%}±%{%f%k%b%}"
  else
    echo ' '
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{${bkg}}%B%F{black}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%B%F{black}%}%n@%{%B%F{blue}%}%m%{%B%F{green}%} %{%b%F{yellow}%K{${bkg}}%}%~%{%B%F{black}%}$(git_prompt_info)%E%{%f%k%b%}
$(_prompt_char)%{%B%F{red}%}∙%{%f%k%b%} '

#RPROMPT='!%{%B%F{cyan}%}%!%{%f%k%b%}'

export LSCOLORS="exfxcxdxbxEgedabagbcbe"
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=1;;46:cd=34;43:su=0;41:sg=0;46:tw=31;42:ow=31;44:"

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

