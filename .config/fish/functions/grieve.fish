function grieve
    set -l trunk
    set -l topic
    set -l default_trunk (git_trunk)

    set -q argv[1]; and set trunk $argv[1]; or set trunk $default_trunk
    set -q argv[2]; and set topic $argv[2]; or set topic HEAD
    set -q argv[3]; and set argv $argv[3..-1]; or set argv

    git log --color --patch --reverse --stat --no-prefix $trunk..$topic $argv | less --pattern '^commit|^diff'
end
