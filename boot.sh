#!/bin/bash

# If container vagrant_smartfox is not currently active, proceed.
if [ "$(docker ps | awk 'FNR >= 2 {print $NF}' | grep smartfox)" != "vagrant_smartfox" ]; then

  # If there is a stopped container named vagrant_smartfox, start the container.
  if [ "$(docker ps -a | awk 'FNR >= 2 {print $NF}' | grep smartfox)" == "vagrant_smartfox" ]; then
    # Start the container
    echo 'Starting stopped vagrant_smartfox container'
    docker start vagrant_smartfox
  else
    # If there is no stopped container name vagrant_smartfox, start a new container named vagrant_smartfox from image nickalie/smartfox.
    echo 'Starting new container vagrant_smartfox'
    docker run -d -p 8080:8080 -p 9933:9933 --name vagrant_smartfox -v /vagrant:/vagrant nickalie/smartfox
  fi

fi