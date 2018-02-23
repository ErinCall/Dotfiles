function glord
    set -l master

    set -q argv[1]; and set master $argv[1]; or set master development
    set -q argv[2]; and set argv $argv[2:-1]
    glorm $master $argv
end
