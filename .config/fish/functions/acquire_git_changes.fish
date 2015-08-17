function acquire_git_changes

    alias _first_character "sed 's/^\(.\).*/\1/'"
# I'm using a single-character variable here for convenience at the command
# line. `c` contains every changed (staged, outstanding, or untracked) file.
    set -g c

    # this un/staged dance is to get the short-status list in the same order
    # that will show up in `git status`.
    set -l staged_files
    set -l unstaged_files
    for line in (command git status --short)
        switch (echo $line | _first_character)
        case M D R A # staged files: Modified, Deleted, Renamed, or Added
            set staged_files $staged_files $line
        case '*'
            set unstaged_files $unstaged_files $line
        end
    end

    for line in $staged_files $unstaged_files
        switch (echo $line | _first_character)
        case 'R' # 'R' in a short-status indicates a staged renamed file. In
                 # this case we have two filenames to think about. This code
                 # will break in the inexcusable case that the old filename
                 # contained ' -> '.
            for file in (echo $line | sed 's/^...//' | sed 's/ -> /\n/')
                set c $c $file
            end
        case '*'
            set c $c (echo $line | sed 's/^...//')
        end
    end

end
