#!/bin/bash

export DNX_USER_HOME=/usr/bin/dnx
export DNX_HOME=$DNX_USER_HOME
export DNVM_HOME=/usr/bin/dnx/dnvm

if [[ ! ":$PATH:" == *":$DNVM_HOME:"* ]]
then
        export PATH=$DNVM_HOME:$PATH
fi

source /usr/bin/dnx/dnvm/dnvm.sh
