function sed --wraps=sed
    if [ -x (which gsed ^/dev/null) ]
        gsed $argv
    else
        command sed $argv
    end
end
