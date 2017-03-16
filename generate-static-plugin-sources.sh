#!/bin/sh

if [ -f ./sourceables.sh ]; then 
    rm ./sourceables.sh
fi

antibody bundle < bundles.txt >> sourceables.sh
