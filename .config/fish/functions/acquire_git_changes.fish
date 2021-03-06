function acquire_git_changes
    # sed-compatible regex for extracting the filename from a git status line.
    # Strips the first three characters (the status information) and
    # surrounding quote marks, if present, from filenames (Git inserts quotes
    # if a filename has spaces, and they're problematic when expanded from a
    # fish variable).
    # FIXME: This regex is inadequate if a file with spaces has been renamed.
    # NOTE: this variable is also used in the functions in git.fish
    set -g FILENAME_FROM_STATUS_RE 's/^..."?(.*[^"])"?/\1/'

    alias _first_two_characters "cut -c 1,2"
    # I'm using a single-character variable here for convenience at the command
    # line. `c` contains every changed (staged, outstanding, or untracked) file.
    set -g c

    # this un/staged dance is to get the short-status list in the same order
    # that will show up in `git status`.
    set -l staged_files
    set -l unstaged_files
    for line in (command git status --short)
        switch (echo $line | _first_two_characters)
        case 'M?' 'D?' 'R?' 'C?' 'A?' # staged files: Modified, Deleted, Renamed, Copied, or Added
            set staged_files $staged_files $line
        case '*'
            set unstaged_files $unstaged_files $line
        end
    end

    for line in $staged_files $unstaged_files
        switch (echo $line | _first_two_characters)
             # 'R' in a short-status indicates a renamed file. 'C' is a staged
             # copied file. In both cases we have two filenames to think
             # about. This code will break in the inexcusable case that the
             # old filename contained ' -> '.
        case 'R?' '?R' 'C?' '?C'
            for file in (echo $line | sed 's/^...//' | perl -pe 's/ -> /\n/')
                set c $c $file
            end
        case '*'
            set c $c (echo $line | sed -E $FILENAME_FROM_STATUS_RE)
        end
    end

end
