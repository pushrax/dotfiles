alias redshiftd="redshift > /dev/null &; disown"
alias mplayer="mplayer -alang jpn -slang eng -ao jack -vo vdpau"
alias fixtime="sudo sh -c 'ntpd -qg && hwclock -w'"
alias mp="ncmpcpp"
alias bx="bundle exec"
alias l="ls -alh"

alias strip-underscores='for i in ./*; do mv -v -- "$i" "${i//_/ }"; done'
