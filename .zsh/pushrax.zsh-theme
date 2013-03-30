# https://github.com/pushrax zsh theme, based on https://github.com/blinks original

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{white}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{${bkg}}%B%F{black}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%b%F{white}%K{${bkg}}%}%n@%{%B%F{white}%}%m %{%B%F{yellow}%K{${bkg}}%}%~%{%B%F{black}%}$(git_prompt_info)%E%{%f%k%b%}
%{%B%F{red}%}∙%{%f%k%b%} '

