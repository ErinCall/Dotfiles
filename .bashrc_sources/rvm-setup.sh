if [ ! $GEM_HOME ]; then
    which rvm &>/dev/null && rvm use 1.9.2
fi

function current_gemset {
    gemset=`echo $GEM_HOME | awk -F '@' '{print $2}'`
    if [ $gemset ]; then
        echo ' {'$gemset'}'
    fi
}
