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

    kubectl apply -f - <<EOT
---
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  generation: 1  
  name: rh-service-binding-operator
  namespace: openshift-operators
spec:
  channel: preview
  installPlanApproval: Automatic
  name: rh-service-binding-operator
  source: redhat-operators
  sourceNamespace: openshift-marketplace
  startingCSV: service-binding-operator.v0.4.0

EOT
}


echo "Install Red Hat Service Binding Operator..."
install_rsb
echo "...Done."
