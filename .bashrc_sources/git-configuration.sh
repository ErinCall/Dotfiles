#!/bin/bash

function grug {
    remote=${1:-origin}
    branch=${2:-`git name-rev --name-only HEAD`}
    echo "resetting to $remote/$branch"
    git fetch $remote && git reset --hard $remote/$branch
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

function gap {
    path=${1:-.}
    git add -p `git_expand_args $path`
}
