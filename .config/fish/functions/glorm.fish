function glorm
    set -l master
    set -l topic

    set -q argv[1]; and set master $argv[1]; or set master master
    set -q argv[2]; and set topic $argv[2]; or set topic HEAD
    set -q argv[3]; and set argv $argv[3..-1]; or set argv

    git log --oneline --reverse $master..$topic $argve
end
