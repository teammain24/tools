#!/bin/bash

if ! command -v git &> /dev/null; then
    echo "git 未安裝，請先安裝 git。"
    exit 1
fi

if ! command -v java &> /dev/null; then
    echo "java 未安裝，請先安裝 java。"
    exit 1
fi

if ! command -v mvn &> /dev/null; then
    echo "maven 未安裝，請先安裝 maven。"
    exit 1
fi

if [ -z "$1" ]; then
    echo "請提供一個 profile 參數，ex 'local' or 'dev'。"
    exit 1
fi

PROFILE=$1

# clone repo
REPO_URL="git@github.com:teammain24/Campmap.git"
git clone $REPO_URL

cd Campmap || { echo "clone fail。"; exit 1; }

mvn spring-boot:run -Dspring-boot.run.profiles=$PROFILE
