#!/bin/bash

PIP_PACKAGES="${RESOURCES_DIRECTORY}/pip/pip_packages"

function install_pip_packages(){
  run "installing pip"
  sudo easy_install pip
  run "install pip packages"
  cat ${PIP_PACKAGES} | xargs sudo pip install --ignore-installed six > /dev/null 2>&1
}

function backup_pip_packages(){
  run "backup pip packages"
  pip list --format=json | jq -r '.[] | .name' > $PIP_PACKAGES
}
