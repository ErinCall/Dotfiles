function do_python() {
    if [ ! $VIRTUALENVWRAPPER_LOCATION ]; then
        VIRTUALENVWRAPPER_LOCATION=/usr/local/share/virtualenvwrapper.sh
    fi
    if [ -s $VIRTUALENVWRAPPER_LOCATION ]; then
        export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
        export WORKON_HOME=~/Envs
        export PIP_VIRTUALENV_BASE=$WORKON_HOME
        export PIP_RESPECT_VIRTUALENV=true
        export PATH=/usr/local/share/python:$PATH

        source $VIRTUALENVWRAPPER_LOCATION
    else
        echo "Couldn't find $VIRTUALENVWRAPPER_LOCATION"
        return 1
    fi
}

function current_virtualenv {
    env=`echo $VIRTUAL_ENV | ack -o '[a-zA-Z\-_]+$'`
    if [ $env ]; then
        echo ' ['$env']'
    fi
}
