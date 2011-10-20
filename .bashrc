set -o noclobber

export PATH=/usr/local/bin:$PATH
. ~/.bashrc_sources/git-completion.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
. ~/.bashrc_sources/perlbrew-setup.sh
. ~/.bashrc_sources/virtualenv-setup.sh
. ~/.bashrc_sources/git-configuration.sh
export PATH=~/bin:$PATH

[[ -s ~/.bashrc_sources/local.sh ]] && source ~/.bashrc_sources/local.sh

export VIRTUAL_ENV_DISABLE_PROMPT=1
export PS1='\n[1;33m\j[1;31m§[1;35m\h[1;31m§[0;32m\w/[0;37m$(current_virtualenv)$(__git_ps1 " (%s)")[1;37m\n§ '
export GIT_PS1_SHOWDIRTYSTATE=1
export NOSE_REDNOSE=1
export NOSE_REDNOSE_COLOR='force'

which mvim &>/dev/null && EDITOR='mvim -f -c "au VimLeave * !open -a iTerm"' || EDITOR=vim
export PAGER=less
export LESS=-FRX

alias vb="$EDITOR ~/.bashrc"
alias sb='. ~/.bashrc'
alias notepad='rlwrap -ir cat - > /dev/null #'
alias read_silently="perl -MTerm::ReadKey -e 'ReadMode(q[noecho]); while (<>) {}; ReadMode(0)'"
alias now="date -u '+%Y%m%d%H%M%S'"

alias      ..='cd ..'
alias     ...='cd ../..'
alias    ....='cd ../../..'
alias   .....='cd ../../../..'
alias  ......='cd ../../../../..'
alias .......='cd ../../../../../..'

alias 2..='cd ../..'
alias 3..='cd ../../..'
alias 4..='cd ../../../..'
alias 5..='cd ../../../../..'
alias 6..='cd ../../../../../..'

# GNU systems
export LS_COLORS="no=00:fi=00:di=01;36:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:"
# BSD systems including Darwin
export CLICOLOR=1
export LSCOLORS="Eafxcxdxbxegedabagacad"

umask u=rwx,g=rwx,o=rx
