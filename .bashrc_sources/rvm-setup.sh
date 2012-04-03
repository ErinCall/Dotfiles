function do_ruby {
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
    rvm use 1.9.2
}

function current_gemset {
    gemset=`echo $GEM_HOME | awk -F '@' '{print $2}'`
    if [ $gemset ]; then
        echo ' {'$gemset'}'
    fi
}

alias ber='bundle exec rake'
