export PATH=/usr/local/share/python:$PATH
function do_python() {
    if [ ! $VIRTUALENVWRAPPER_LOCATION ]; then
        VIRTUALENVWRAPPER_LOCATION=/usr/local/share/virtualenvwrapper.sh
    fi
    if [ -s $VIRTUALENVWRAPPER_LOCATION ]; then
        export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
        export WORKON_HOME=~/Envs
        export PIP_VIRTUALENV_BASE=$WORKON_HOME
        export PIP_RESPECT_VIRTUALENV=true

        source $VIRTUALENVWRAPPER_LOCATION
    else
        echo "Couldn't find $VIRTUALENVWRAPPER_LOCATION"
        return 1
    fi
    # osx Lion has been causing me weird problems in mkvirtualenv:
    # distutils.errors.DistutilsPlatformError: $MACOSX_DEPLOYMENT_TARGET
    # mismatch: now "10.4" but "10.7" during configure
    # exporting this prevents those problems
    export MACOSX_DEPLOYMENT_TARGET=`osx_version.py`
}

function current_virtualenv {
    env=`echo $VIRTUAL_ENV | ack -o '[a-zA-Z\-_0-9]+$'`
    if [ $env ]; then
        echo ' ['$env']'
    fi
}
