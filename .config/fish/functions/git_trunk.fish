function git_trunk
    set -l trunk_file (git rev-parse --show-toplevel)/.trunk

    if test -r $trunk_file
        cat $trunk_file
    else
        echo master
    end
end
