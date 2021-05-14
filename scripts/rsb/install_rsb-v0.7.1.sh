#!/bin/sh

#
# Copyright 2020- IBM Inc. All rights reserved
# SPDX-License-Identifier: Apache2.0
#

# Install the Red Hat Service Binding Operator (rsb) 
# If you do not want to install it via UI/OperatorHub
#
# OperatorGroup is not needed here, because this operator supports AllNamespaces and OperatorGroup exists already in openshift-operators

install_rsb() {

  kubectl apply -f https://github.com/redhat-developer/service-binding-operator/releases/download/v0.7.1/release.yaml
}


echo "Install Red Hat Service Binding Operator..."
install_rsb
echo "...Done."
