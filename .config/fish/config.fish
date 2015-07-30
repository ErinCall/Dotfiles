set PATH /usr/local/bin $PATH
set PATH ~/bin $PATH
set PATH node_modules/.bin $PATH
set PATH bin $PATH

set -g -x GIT_AUTHOR_NAME 'Erin Call'
set -g -x GIT_AUTHOR_EMAIL 'hello@erincall.com'
set -g -x GIT_COMMITTER_NAME $GIT_AUTHOR_NAME
set -g -x GIT_COMMITTER_EMAIL $GIT_AUTHOR_EMAIL

if not begin
    [ -f ~/.gpg-agent-info ]
    and kill -0 (cut -d: -f 2 ~/.gpg-agent-info) ^/dev/null
end
    gpg-agent --daemon --no-grab --write-env-file ~/.gpg-agent-info >/dev/null ^&1
end
set -g -x GPG_AGENT_INFO (cut -c 16- ~/.gpg-agent-info)
set -g -x GPG_TTY (tty)
