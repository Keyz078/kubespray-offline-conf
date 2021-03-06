#!/bin/bash

if [[ $1 == "" ]]
then
    echo "Usage: ./change-kube-ver.sh <version>";
    exit
fi
source config.sh
version=$1
echo "Configuring version......";
./change-kube-ver.sh ${version} || exit 1
./download-kubespray-files.sh || exit 1
cd outputs/ && ./load-push-all-images.sh || exit 1
cd ..
echo "kubernetes ${version} has been added to the repository"
