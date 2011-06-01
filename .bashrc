set -o noclobber

export PATH=/usr/local/bin/:$PATH
. ~/.bashrc_sources/git-completion.sh
. ~/.bashrc_sources/perlbrew-setup.sh
. ~/.bashrc_sources/virtualenv-setup.sh
export PATH=~/bin:$PATH

if [ -f ~/.bashrc_sources/local.sh ]; then
    . ~/.bashrc_sources/local.sh
fi

alias vb='vim ~/.bashrc'
alias sb='. ~/.bashrc'
alias notepad='rlwrap -ir cat - > /dev/null #'
alias steve=jobs

function grugrhom {
    MASTER=${1:-origin/master}
    git remote update && git reset --hard $MASTER
}
function glorm {
    MASTER=${1:-master}
    git log --oneline --reverse $MASTER..
}
alias glorom='glorm origin/master'
function grieve {
    MASTER=${1:-master}
    git log -p --reverse --stat --no-prefix $MASTER..
}
alias grieveom='grieve origin/master'

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

export PS1='\n[1;33m\j[1;31m§[1;35m\h[1;31m§[0;32m\w/[0;37m $(__git_ps1 "(%s)")[1;37m\n§ '

export EDITOR='mvim -f'
export PAGER=less
export LESS=-FRX

# GNU systems
export LS_COLORS="no=00:fi=00:di=01;36:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:"
# BSD systems including Darwin
export CLICOLOR=1
export LSCOLORS="Eafxcxdxbxegedabagacad"

export GIT_PS1_SHOWDIRTYSTATE=1

umask u=rwx,g=rwx,o=rx
