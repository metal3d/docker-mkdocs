#!/bin/bash


if [ "$UID" != "1000" ]; then
    usermod -u $UID mkdocuser
fi

if [ "$GID" != "1000" ]; then
    usermod -g $GID mkdocuser
fi


cmd="mkdocs $1"
if [ "$1" == "serve" ]; then
    cmd="$cmd --dev-addr=$ADDR"
fi

exec su -s /bin/bash -c "mkdocs $(printf "%q " $cmd)" -- mkdocuser

