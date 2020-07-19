set PATH /usr/local/bin $PATH
set PATH ~/bin $PATH

status --is-interactive; and . (rbenv init -|psub)
status --is-interactive; and . (nodenv init -|psub)
set PATH node_modules/.bin $PATH

set PATH bin $PATH
set PATH ~/go/bin $PATH
set PATH /usr/local/opt/python@3.8/libexec/bin $PATH

set -g -x GOPATH ~/go/

# set tabwidth of 4.
# in iTerm, at least, this'll apply to all tabs/windows but disappears on quit
tabs -4 -T $TERM

gpg-agent --daemon --no-grab >/dev/null 2>&1
set -g -x GPG_TTY (tty)

set -g -x NOSE_REDNOSE '1'
set -g -x NOSE_REDNOSE_COLOR 'force'

alias mvimf "mvim -f -c 'au VimLeave * !open -a iTerm'"
set -g -x EDITOR vim
if [ -x (which subl) ]
    set EDITOR 'subl --wait --new-window'
end

set -g -x PAGER 'less'
# -x1,5 sets the tabwidth in less; obviously it can't use the term settings
set -g -x LESS '-FRXx1,5'

# OSX Catalina switched the default shell to zsh. That's fine, but sometimes I
# want to launch bash for testing purposes. I don't need to be notified about
# the change every time I do that.
set -g -x BASH_SILENCE_DEPRECATION_WARNING 1

set -g -x BAT_CONFIG_PATH ~/.config/bat/bat.conf

alias vb $EDITOR" ~/.config/fish/config.fish"
alias sb "source ~/.config/fish/config.fish"
alias read_silently "perl -MTerm::ReadKey -e 'ReadMode(q[noecho]); while (<>) {}; ReadMode(0)'"
alias now "date -u '+%Y%m%d%H%M%S'"
alias ll 'ls -l -h'
alias sp 'subl pro'
alias unlock_gpg 'echo "" | gpg --sign >/dev/null'

if [ -x (which ipconfig) ]
    alias localip "ifconfig -l | tr ' ' '\n' | xargs -I'{}' ipconfig getifaddr '{}'"
end

alias     ... 'cd ../..'
alias    .... 'cd ../../..'
alias   ..... 'cd ../../../..'
alias  ...... 'cd ../../../../..'
alias ....... 'cd ../../../../../..'

alias prettify 'pbpaste | pretty_json | pbcopy'

alias gd 'git dif'
alias gdc 'git dif --cached'
alias gs 'git status'
alias gc 'git commit'
alias gap 'git add --patch'
alias glorom 'glorm origin/master'

alias cb 'git symbolic-ref HEAD 2>/dev/null | sed "s:refs/heads/::"'

set -g success_icons 😏 👏 🙌 😘 👻 🎉 🙏 😎 🍩 👌 🌟 🎊 ✨
set -g failure_icons 😤 😒 😧 💔 🔥 ❌ 😱 😰 😨 😩 😵 😡 😖

function set_start_time \
         --on-event fish_preexec \
         --description 'note the epoch-time when each command started'
    set -g command_started (date +%s)
end

function potentially_notify \
         --on-event fish_postexec \
         --description 'display a notification when a command finishes, if it took more than 20 seconds to run'
    set -l last_status $status
    set -l command_ended (date +%s)
    set -l message_icon

    set -g command_duration (math "$command_ended" "-" "$command_started")

    if begin
        test $command_duration -gt 20 > /dev/null
        and which terminal-notifier > /dev/null
    end
        if [ $last_status = 0 ]
            set message_icon (one_of $success_icons)
        else
            set message_icon (one_of $failure_icons)
        end

        terminal-notifier -title "$message_icon $argv[1]" \
                          -message "`$argv` completed."
    end
end

# GNU systems
set -g -x LS_COLORS "no=00:fi=00:di=01;36:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:"
# BSD systems including Darwin
set -g -x LSCOLORS "Eafxcxdxbxegedabagacad"

if [ -f $HOME/.config/fish/local.fish ]
  source $HOME/.config/fish/local.fish
end
