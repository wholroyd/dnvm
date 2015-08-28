#!/bin/bash

export DNX_USER_HOME=/usr/local/bin/dnx
export DNX_HOME=$DNX_USER_HOME
export DNVM_HOME=/usr/local/bin/dnx/dnvm

if [[ ! ":$PATH:" == *":$DNVM_HOME:"* ]]
then
        export PATH=$DNVM_HOME:$PATH
fi

source /usr/local/bin/dnx/dnvm/dnvm.sh
