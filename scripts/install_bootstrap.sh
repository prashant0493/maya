#!/bin/bash

set -e

CURDIR=`pwd`

# Remove if already present
# NOTE: this is install only script
echo "Cleaning old maya boostrapping if any"
sudo rm -rf /etc/maya.d/

sudo mkdir -p /etc/maya.d/scripts
sudo mkdir -p /etc/maya.d/templates

sudo chmod a+w /etc/maya.d/
sudo chmod a+w /etc/maya.d/scripts
sudo chmod a+w /etc/maya.d/templates

# Fetch various install scripts
cd /etc/maya.d/scripts

echo "Fetching utility scripts ..."
curl -sSL https://raw.githubusercontent.com/openebs/maya/master/scripts/get_first_private_ip.sh -o get_first_private_ip.sh

echo "Fetching consul scripts ..."
curl -sSL https://raw.githubusercontent.com/openebs/maya/master/scripts/install_consul.sh -o install_consul.sh
curl -sSL https://raw.githubusercontent.com/openebs/maya/master/scripts/set_consul_as_server.sh -o set_consul_as_server.sh
curl -sSL https://raw.githubusercontent.com/openebs/maya/master/scripts/start_consul_server.sh -o start_consul_server.sh

echo "Fetching nomad scripts ..."
curl -sSL https://raw.githubusercontent.com/openebs/maya/master/scripts/install_nomad.sh -o install_nomad.sh
curl -sSL https://raw.githubusercontent.com/openebs/maya/master/scripts/set_nomad_as_server.sh -o set_nomad_as_server.sh
curl -sSL https://raw.githubusercontent.com/openebs/maya/master/scripts/start_nomad_server.sh -o start_nomad_server.sh

# Fetch various templates
cd /etc/maya.d/templates

echo "Fetching consul config templates ..."
curl -sSL https://raw.githubusercontent.com/openebs/maya/master/templates/consul-server.json.tmpl -o consul-server.json.tmpl
curl -sSL https://raw.githubusercontent.com/openebs/maya/master/templates/consul-server.service.tmpl -o consul-server.service.tmpl

echo "Fetching nomad config templates ..."
curl -sSL https://raw.githubusercontent.com/openebs/maya/master/templates/nomad-server.hcl.tmpl -o nomad-server.hcl.tmpl
curl -sSL https://raw.githubusercontent.com/openebs/maya/master/templates/nomad-server.service.tmpl -o nomad-server.service.tmpl

cd ${CURDIR}