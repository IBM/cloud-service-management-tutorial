<!-- This should be the location of the title of the repository, normally the short name -->
# Cloud Service Management - Cloud Native Way - Tutorial

[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/5846/badge)](https://bestpractices.coreinfrastructure.org/projects/5846)

<!-- Build Status, is a great thing to have at the top of your repository, it shows that you take your CI/CD as first class citizens -->
<!-- [![Build Status](https://travis-ci.org/jjasghar/ibm-cloud-cli.svg?branch=master)](https://travis-ci.org/jjasghar/ibm-cloud-cli) -->

<!-- Not always needed, but a scope helps the user understand in a short sentance like below, why this repo exists -->
## Scope

This repository contains the scripts of the tutorial [Provision, bind, and use services in a cloud-native way](https://developer.ibm.com/depmodels/microservices/tutorials/provision-bind-and-use-services-in-a-cloud-native-way/).

Applications often rely on a number of services to do their job. Called _backing services_, these can include databases, search engines, and AI engines. The [twelve-factor methodology](https://12factor.net/) for app development states that it is crucial to provision and bind a backing service as part of your application configuration (described in [Factor 3](https://12factor.net/config) and [Factor 4](https://12factor.net/backing-services)). In addition, it is important that you implement a secure way to retrieve connection information, such as credentials. This tutorial shows you how to manage backing services as code using the [IBM Cloud Operator](https://github.com/IBM/cloud-operators) and the [Red Hat Service Binding Operator](https://github.com/redhat-developer/service-binding-operator) to provision, bind, and use services in a cloud-native way. 

In this tutorial, you deploy an application that consumes a backing service, where all the configuration parameters to provision and bind the service are also part of the application configuration. Figure 1 visualizes the solution in a Red Hat OpenShift cluster with the related components and Kubernetes resources.



## License

All source files must include a Copyright and License header. The SPDX license header is 
preferred because it can be easily scanned.

If you would like to see the detailed LICENSE click [here](LICENSE).

```text
#
# Copyright 2020- IBM Inc. All rights reserved
# SPDX-License-Identifier: Apache2.0
#
```
