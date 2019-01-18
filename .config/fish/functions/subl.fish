function subl --wraps=~/bin/subl
    set -l translated_argv

    # Fish's `for in` doesn't work with an empty list, since it just comes out
    # as `for arg in`, which is a syntax error
    if test (count $argv) -lt 1 >/dev/null
        command subl
        return $status
    end

    for arg in $argv
        if begin
            [ "$arg" = "project" ]
            or [ "$arg" = "pro" ]
        end
            set -l path (pwd)
            set -l project (basename $path)

            if not [ -e ".sublime-project/$project.sublime-project" ]
                # Make the project
                mkdir -p ./.sublime-project

                echo "{\"folders\":[{\"path\":\""$path"\"}]}" > ".sublime-project/$project.sublime-project"
                echo "{}" > ".sublime-project/$project.sublime-project"
            end

            set translated_argv "--project" ".sublime-project/$project.sublime-project" "--new-window" "--add" "."

        else if begin
            # is $arg a number, and small enough to be an index of $c?
            echo $arg | egrep '^[0-9]+$' >/dev/null 2>&1
            and test $arg -le (count $c) >/dev/null
        end
            set translated_argv $translated_argv $c[$arg]
        # is $arg a fish array slice?
        # TODO: bounds checking here? It's been obnoxiously long-winded when
        # I've tried in the past.
        else if echo $arg | egrep '^[0-9]+\.\.[0-9]+$' >/dev/null 2>&1
            set translated_argv $translated_argv $c[$arg]
        else
            set translated_argv $translated_argv $arg
        end
    end

    command subl $translated_argv
end
