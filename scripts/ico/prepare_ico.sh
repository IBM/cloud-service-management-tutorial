#!/bin/sh

#
# Copyright 2020- IBM Inc. All rights reserved
# SPDX-License-Identifier: Apache2.0
#

# Prepare the IBM Cloud Operator (ico) configuration
# This script is only useful if you do not want to use the existing ico configuration script
# https://github.com/IBM/cloud-operators/blob/master/hack/configure-operator.sh
# cause you do not have ibmcloud cli locally installed
# The values are expected as input parameter
# 
# Additionally this script use the best practice to separate the secrets from the workload namespace
# so that the operator/developer has no access to the API keys.

API_KEY=$1
RESOURCE=${2:-Default}
RESOURCE_ID=$3
REGION=${4:-eu-de}
USER_ID=${5:-serviceid-ico}

usage() {
    cat >&2 <<EOT
Usage: $(basename "$0") <API_KEY> <RESOURCE> <RESOURCE_ID> <REGION> <USER_ID> 
    API_KEY     API key.
    RESOURCE    Resource group, default is "Default".
    RESOURCE_ID Resource id of the resource group, value from: ibmcloud resource groups
    REGION      Region, value from: ibmcloud regions
    USER_ID     User ID.
EOT
}

configure() {

    b64_region=$(printf '%s' "$REGION" | base64)
    b64_apikey=$(printf '%s' "$API_KEY" | base64)

    kubectl apply -f - <<EOT
apiVersion: v1
kind: Namespace
metadata:
  name: ibmcloud-operator-configs
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: ibmcloud-operator-config
  namespace: openshift-operators
  labels:
    app.kubernetes.io/name: ibmcloud-operator
data:
  namespace: ibmcloud-operator-configs
---
apiVersion: v1
kind: Secret
metadata:
  name: ico-test-ibmcloud-operator-secret
  labels:
    app.kubernetes.io/name: ibmcloud-operator
  namespace: ibmcloud-operator-configs
type: Opaque
data:
  api-key: $b64_apikey
  region: $b64_region
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: ico-test-ibmcloud-operator-defaults
  namespace: ibmcloud-operator-configs
  labels:
    app.kubernetes.io/name: ibmcloud-operator
data:
  org: ""
  region: "${REGION}"
  resourcegroup: "${RESOURCE}"
  resourcegroupid: "${RESOURCE_ID}"
  space: ""
  user: "${USER_ID}"  
EOT
}

if [[ $# -le 1 ]] ; then
    usage
    exit 1
fi


echo "Prepare and configure IBM Cloud Operators..."
configure
echo "...Done."
