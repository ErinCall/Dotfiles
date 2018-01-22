function grug
    set -l remote
    set -l branch
    set -q argv[1]; and set remote $argv[1]; or set remote origin
    set -q argv[2]; and set branch $argv[2]; or set branch (cb)

    set -l remote_url (git remote -v | grep $remote | grep fetch | cut -f2 | sed 's/ .*//')
    echo "resetting to "$remote_url" at "$branch
    git fetch $remote; and git reset --hard $remote/$branch
end
