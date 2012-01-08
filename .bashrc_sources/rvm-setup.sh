function current_gemset {
    gemset=`echo $GEM_HOME | awk -F '@' '{print $2}'`
    if [ $gemset ]; then
        echo ' {'$gemset'}'
    fi
}

alias ber='bundle exec rake'
