function gsmag
    set -l trunk (git_trunk)
    git switch $trunk
    grug
end
