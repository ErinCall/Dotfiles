if [ -s /usr/local/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    export WORKON_HOME=~/Envs
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export PIP_RESPECT_VIRTUALENV=true
    export PATH=/usr/local/share/python/:$PATH

    source /usr/local/bin/virtualenvwrapper.sh
fi

function current_virtualenv {
    env=`echo $VIRTUAL_ENV | ack -o '[a-zA-Z\-]+$'`
    if [ $env ]; then
        echo ' ['$env']'
    fi
}
