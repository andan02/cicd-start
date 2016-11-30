#!/bin/bash

export CICDSTARTHOME=`echo $PWD`

eval `ssh-agent`
# replace with your key for github
ssh-add ~/.ssh/id_rsaANS

cd ..

if [ ! -d "cicd-common" ]; then
  printf "\n***GIT CLONE CICD-COMMON)***\n"
  git clone git@github.com:cisco-cis/cicd-common.git; cd cicd-common
else
  printf "\n***GIT PULL CICD-COMMON)***\n"
  cd cicd-common; git pull
fi

cd run
export CICDHOME=`echo $PWD/../..`

./fullstack.sh $1 $2 $3 $4
