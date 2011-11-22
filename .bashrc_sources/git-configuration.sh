#!/bin/bash

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
function gap {
    path=${1:-.}
    git add -p $path
}
