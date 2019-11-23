function gitignore
    set -l language $argv[1]

    if test "$language" = ""
        echo "Usage: gitignore LANGUAGE" >&2
        return 1
    end

    if [ -f ./.gitignore ]
        echo "A .gitignore already exists!" >&2
        return 2
    end

    # Ensure the first character is uppercased
    set language (echo $language | awk '{print toupper(substr($0, 0, 1)) substr($0, 2, length($0))}')
    # Strip a trailing `.gitignore`, if present
    set language (echo $language | sed 's/\.gitignore$//')

    curl -f "https://raw.githubusercontent.com/github/gitignore/master/$language.gitignore" > .gitignore
    set -l last_status $status
    if test $last_status -ne 0
        rm .gitignore
        return $last_status
    end
end
