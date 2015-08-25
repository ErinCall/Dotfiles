function gt
    set -l ticket $argv[1]
    set -l branch (git branch | sed s/.// | grep $ticket)
    if [ $branch ]
        echo $branch
    else
        echo "no branch found for"$ticket >&2
        return 2
    end
end
