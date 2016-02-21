#!/bin/bash

# If container vagrant_smartfox is not currently active, proceed.
if [ "$(docker ps | awk 'FNR >= 2 {print $NF}' | grep smartfox)" != "vagrant_smartfox" ]; then

  # If there is a stopped container named vagrant_smartfox, start the container.
  if [ "$(docker ps -a | awk 'FNR >= 2 {print $NF}' | grep smartfox)" == "vagrant_smartfox" ]; then
    # Start the container
    echo 'Starting stopped vagrant_smartfox container'
    docker start vagrant_smartfox
  else
    # If there is no stopped container name vagrant_smartfox, start a new container named vagrant_smartfox from image timlien/docker-smartfox.
    echo 'Starting new container vagrant_smartfox'
    docker run -d --name vagrant_smartfox -p 5000:5000 -p 8080:8080 -p 8787:8787 -p 9933:9933 -v /vagrant/extensions:/var/SmartFoxServer_2X/SFS2X/extensions -v /vagrant/logs:/var/SmartFoxServer_2X/SFS2X/logs timlien/docker-smartfox 
  fi

fi