function glorm
    set -l trunk
    set -l topic
    set -l default_trunk

    set -l trunk_file (git rev-parse --show-toplevel)/.trunk

    if test -r $trunk_file
        set default_trunk (cat $trunk_file)
    else
        set default_trunk master
    end

    set -q argv[1]; and set trunk $argv[1]; or set trunk $default_trunk
    set -q argv[2]; and set topic $argv[2]; or set topic HEAD
    set -q argv[3]; and set argv $argv[3..-1]; or set argv

    git log --oneline --reverse $trunk..$topic $argv
end
