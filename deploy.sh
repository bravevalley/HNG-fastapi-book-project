#! /bin/bash

# Set working dir
cd "$(dirname "$0")"

# Variables
REPO='https://github.com/bravevalley/HNG-fastapi-book-project.git'

# Jobs

update_api () {
    # Check if dir exist
    if [ -d HNG-fastapi-book-project/ ] ; then
        # rm if exist
        rm -rf HNG-fastapi-book-project/
    fi 

    # Stop and remove previously running Container/Images
    docker stop fastapi-app && docker rm fastapi-app
    docker rmi fastapi-app

    # clone repo
    git clone $REPO


    # Change workdir
    cd HNG-fastapi-book-project/

    # build image
    # run container
    docker build -t fastapi-app  . && docker run -dp  8000:8000 --name fastapi-app fastapi-app
}

update_api
