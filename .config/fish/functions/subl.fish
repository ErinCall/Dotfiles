function subl
    set -l translated_argv

    # Fish's `for in` doesn't work with an empty list, since it just comes out
    # as `for arg in`, which is a syntax error
    if math (count $argv) '<' 1 >/dev/null
        command subl
        return $status
    end

    for arg in $argv
        if begin
            # is $arg a number, and small enough to be an index of $c?
            echo $arg | egrep '^[0-9]+$' >/dev/null ^&1
            and math $arg '<=' (count $c) >/dev/null
        end
            set translated_argv $translated_argv $c[$arg]
        # is $arg a fish array slice?
        # TODO: bounds checking here? It's been obnoxiously long-winded when
        # I've tried in the past.
        else if echo $arg | egrep '^[0-9]+\.\.[0-9]+$' >/dev/null ^&1
            set translated_argv $translated_argv $c[$arg]
        else
            set translated_argv $translated_argv $arg
        end
    end

    command subl $translated_argv
end
