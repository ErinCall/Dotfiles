set -o noclobber
shopt -s cdspell    # attempt to correct typos when cd'ing
shopt -s checkhash  # if a hashed command is not found, run a path search for it
  # this is espcially useful because of adding `bin` to my path below--if I cd out of, say, /usr,
  # a command that was in ./bin may be no longer available and need to be re-discovered.
shopt -s histappend # append to .bash_history, instead of clobbering it
shopt -s histreedit # prompt to retry failed history substitutions

export PATH=/usr/local/bin:$PATH
. ~/.bashrc_sources/git-completion.sh
. ~/.bashrc_sources/perlbrew-setup.sh
. ~/.bashrc_sources/virtualenv-setup.sh
. ~/.bashrc_sources/ghci-setup.sh
. ~/.bashrc_sources/rbenv-setup.sh
. ~/.bashrc_sources/externals/scm_breeze/scm_breeze.sh
. ~/.bashrc_sources/git-configuration.sh
. ~/.bashrc_sources/scm_breeze-configuration.sh
export PATH=~/bin:$PATH
export PATH=~/.cabal/bin:$PATH
export PATH=node_modules/.bin:$PATH
export PATH=bin:$PATH

export GIT_AUTHOR_NAME='Erin Call'
export GIT_AUTHOR_EMAIL='hello@erincall.com'
export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL

[[ -s ~/.bashrc_sources/local.sh ]] && source ~/.bashrc_sources/local.sh

# kill -0 checks to see if the pid exists
if test -f $HOME/.gpg-agent-info && kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info` 2>/dev/null; then
    GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info | cut -c 16-`
else
# No, gpg-agent not available; start gpg-agent
    eval `gpg-agent --daemon --no-grab --write-env-file $HOME/.gpg-agent-info`
fi
export GPG_TTY=`tty`
export GPG_AGENT_INFO

export VIRTUAL_ENV_DISABLE_PROMPT=1
export PS1="\n\[$(tput bold)\]\[$(tput setaf 3)\]\j\[$(tput setaf 1)\]§\[$(tput setaf 5)\]\h\[$(tput setaf 1)\]§\[$(tput setaf 2)\]\w\[$(tput sgr0)\]\$(current_virtualenv)\$(__git_ps1 \" (%s)\")\n\[$(tput bold)\]\[$(tput setaf 7)\]§ \[$(tput sgr0)\]"
export GIT_PS1_SHOWDIRTYSTATE=1
export NOSE_REDNOSE=1
export NOSE_REDNOSE_COLOR='force'

alias mvimf="mvim -f -c 'au VimLeave * !open -a iTerm'"
export EDITOR=vim

subl=$(which subl 2>/dev/null)
if [ -x "$subl" ]; then
    export EDITOR='subl -w'
fi
export PAGER=less
export LESS=-FRX

gsed=$(which gsed)
if [ -x "$gsed" ]; then
	alias sed=gsed
fi

if [ -x "$(which aws)" ]; then
    complete -C aws_completer aws
fi

alias vb="$EDITOR ~/.bashrc"
alias sb='. ~/.bashrc'
alias notepad='rlwrap -ir cat - > /dev/null #'
alias read_silently="perl -MTerm::ReadKey -e 'ReadMode(q[noecho]); while (<>) {}; ReadMode(0)'"
alias now="date -u '+%Y%m%d%H%M%S'"
alias ll='ls -l'

alias sep='echo "[1;34m################################################################################[0;37m"'

if [ -x "$(which ipconfig)" ]; then
    alias localip="ifconfig -l | tr ' ' '\n' | xargs -I{} ipconfig getifaddr {}"
fi

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

alias prettify='pbpaste | pretty_json | pbcopy'

# GNU systems
export LS_COLORS="no=00:fi=00:di=01;36:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:"
# BSD systems including Darwin
export CLICOLOR=1
export LSCOLORS="Eafxcxdxbxegedabagacad"

export HISTCONTROL=ignorespace:$HISTCONTROL

umask u=rwx,g=rwx,o=rx
