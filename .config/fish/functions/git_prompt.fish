function git_prompt
    set -l gitdir (command git rev-parse --git-dir ^/dev/null)
    if [ $status != 0 ]
        return
    end
    set -l rebasing     ''
    set -l branch       ''
    set -l outstanding  ''
    set -l head         ''
    set -l bare         ''

    if [ -f $gitdir"/rebase-merge/interactive" ]
        set rebasing '|REBASE-i'
        set branch (cat $gitdir"/rebase-merge/head-name")
    else if [ -d $gitdir"/rebase-merge" ]
        set rebasing "|REBASE-m"
        set branch (cat $gitdir"/rebase-merge/head-name")
    else
        if [ -d $gitdir"/rebase-apply" ]
            if [ -f $gitdir/"rebase-apply/rebasing" ]
                set rebasing "|REBASE"
            else if [ -f $gitdir"/rebase-apply/applying" ]
                set rebasing "|AM"
            else
                set rebasing "|AM/REBASE"
            end
        else if [ -f $gitdir"/MERGE_HEAD" ]
            set rebasing "|MERGING"
        else if [ -f $gitdir"/BISECT_LOG" ]
            set rebasing "|BISECTING"
        end

        set branch (command git symbolic-ref HEAD ^/dev/null;
                    or echo (cut -c1-7 .git/HEAD ^/dev/null)...)
        set branch (echo $branch | sed 's:refs/heads/::')
    end

    if [ (command git rev-parse --is-inside-git-dir ^/dev/null) = "true" ]
        if [ (command git rev-parse --is-inside-work-tree ^/dev/null) = "true" ]
            set bare "BARE:"
        else
            set branch "GIT_DIR!"
        end
    else if [ (command git rev-parse --is-inside-work-tree ^/dev/null) = "true" ]

        command git diff --no-ext-diff --ignore-submodules \
                 --quiet --exit-code; or set outstanding '◯ '
        command git diff --no-ext-diff --ignore-submodules --cached \
                 --quiet --exit-code; or set head '◉ '

        if not command git rev-parse --quiet --verify HEAD >/dev/null ^&1
            set head "#$head"
        end
    end

    echo -n '('$bare$branch
    if begin
        [ $outstanding ]
        or [ $head ]
    end
        echo -n ' '
    end
    echo $head$outstanding$rebasing')'
end

