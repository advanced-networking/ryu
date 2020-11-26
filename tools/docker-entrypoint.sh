#!/bin/bash
set -e

clear
cd ${CONTROLLER_DIR}

if [ -f requirements.txt ]; then
  echo "Installing Requirements"
  pip install -r requirements.txt
fi

echo "Creating Controller"
if [ ! -z ${VERBOSE} ]; then
  ryu-manager --verbose ${CONTROLLER}
else
  ryu-manager ${CONTROLLER}
fi
