function personal
    set --global --export GIT_AUTHOR_EMAIL hello@erincall.com
    set --global --export GIT_COMMITTER_EMAIL $GIT_AUTHOR_EMAIL

    eval $argv
    set -l exit_status $status

    set --erase GIT_AUTHOR_EMAIL
    set --erase GIT_COMMITTER_EMAIL

    return $exit_status
end
