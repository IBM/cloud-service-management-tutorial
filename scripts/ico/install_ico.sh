#!/bin/sh

#
# Copyright 2020- IBM Inc. All rights reserved
# SPDX-License-Identifier: Apache2.0
#

# Install the IBM Cloud Operator (ico) 
# If you do not want to install it via UI/OperatorHub
#
# OperatorGroup is not needed here, because this operator supports AllNamespaces and OperatorGroup exists already in openshift-operators

install_ico() {

    kubectl apply -f - <<EOT
---
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  generation: 1  
  name: ibmcloud-operator
  namespace: openshift-operators
spec:
  channel: stable
  installPlanApproval: Automatic
  name: ibmcloud-operator
  source: community-operators
  sourceNamespace: openshift-marketplace
  startingCSV: ibmcloud-operator.v1.0.0

EOT
}


echo "Install IBM Cloud Operators..."
install_ico
echo "...Done."
