function postureminder
    set -l sound

    if test (count $argv) -gt 0
        set sound -sound

        switch $argv[1]
        case "sound"
            set sound $sound Blow
        case '*'
            set sound $sound $argv[1]
        end
    end

    while true; terminal-notifier -title Posture -message 'spine straight, shoulders down' $sound -group postureminder; sleep (math 60 '*' 10); end
end
