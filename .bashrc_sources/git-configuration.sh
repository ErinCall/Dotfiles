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
    TOPIC=${2:-HEAD}
    shift 2
    git log -p --reverse --stat --no-prefix $MASTER..$TOPIC $@
}
alias grieveom='grieve origin/master'

alias gap &>/dev/null && unalias gap #this may've came in from scm_breeze but I want my own
function gap {
    path=${1:-.}
    git add -p `git_expand_args $path`
}

function gcot {
    ticket=$1
    if [ $ticket ]; then
      branch=`git branch | sed s/.// | ack $ticket`
      if [ $branch ]; then
        git checkout $branch
      else
        echo "no branch found for $ticket"
        return 2
      fi
    else
      echo "You need to give me a ticket"
      return 1
    fi
}
