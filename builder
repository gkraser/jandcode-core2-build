#!/bin/bash

export WD=`realpath $(dirname $0)`

source ${WD}/env.sh
bash $JC_RUN -f:${WD}/builder.jc $*



