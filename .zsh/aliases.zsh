alias g=git
alias gf="git fetch"

alias kc=kubectl

alias redshiftd="redshift > /dev/null &; disown"
alias fixtime="sudo sh -c 'ntpd -qg && hwclock -w'"
alias mp="ncmpcpp"
alias bx="bundle exec"
alias l="ls -alh"
alias le="less"
alias mru="ls -ltr"

alias strip-underscores='for i in ./*; do mv -v -- "$i" "${i//_/ }"; done'
