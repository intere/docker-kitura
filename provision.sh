#!/bin/bash

setTimezone() {
  timedatectl set-timezone MST;
}

patchUfw() {
  cp /vagrant/config/ufw /etc/default/ufw
  ufw reload
}

buildContainers() {
  /bin/bash -c 'docker build --tag kitura /vagrant/docker/kitura-ubuntu-docker'
}

ensureDockerIsInstalled() {
  if [ "$(/bin/bash -c 'which docker')" == "" ] ; then
    # Install Docker (latest stable)
    curl -sSL https://get.docker.com/ | sh
  fi
}

startKituraContainer() {
  if [ "$(/bin/bash -c 'docker ps' | grep kitura)" == "" ] ; then
    if [ "$(/bin/bash -c 'docker images'|grep swift-ubuntu)" == "" ] ; then
      # Fire up Kitura
      /bin/bash -c 'docker run -d \
        -p 8090:8090 \
        --name="kitura" \
        kitura'
    else
      /bin/bash -c 'docker restart kitura'
    fi
  else
    echo "Kitura is already running"
  fi
}

startContainers() {
  setTimezone;
  patchUfw;

  startKituraContainer;
}

main() {
  ensureDockerIsInstalled;
  buildContainers;
  startContainers;
  ufw disable;
}

main;
