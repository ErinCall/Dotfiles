export DEFAULT_RVM_RUBY=2.1.2
[[ -d ~/.rvm/bin ]] && export PATH=$PATH:~/.rvm/bin
function do_ruby {
    if [ -n "$(alias cd 2>/dev/null)" ]; then
        unalias cd
    fi
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
    rvm use $DEFAULT_RVM_RUBY
    . ~/.bashrc_sources/externals/scm_breeze/scm_breeze.sh
}

function current_gemset {
    gemset=`echo $GEM_HOME | awk -F '@' '{print $2}'`
    if [ $gemset ]; then
        echo ' {'$gemset'}'
    fi
}

alias ber='bundle exec rake'
