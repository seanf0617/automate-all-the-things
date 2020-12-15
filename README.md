# automate-all-the-things
> An example repo for deploying a node app hosted inside a docker container to an EKS cluster in AWS. The application is built and deployed using a Jenkins CI/CD pipeline.
![](/images/yoda.jfif)

> We're all using it - the continuous integration and continuous delivery pipeline. 

## Prerequisites for Jenkins server

- The server must be exposed to the internet to receive github commit/pull requests. For more information on how to expose a local port securely visit the ngrok site (ngrok.com).

- install: Install node & npm on your jenkins server (https://nodejs.org/en/).
- install: Install docker on your jenkins server (https://www.docker.com/).
- install: Install terraform  on your jenkins server (https://www.terraform.io/).
- install: Install aws iam authenticator on your jenkins server (https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html).
- install: For convenience, install kubectl on the server (https://kubernetes.io/docs/tasks/tools/install-kubectl/)

If you wish to run a prebuilt docker image for jenkins for this example, one is available here:

https://hub.docker.com/repository/docker/chrisgallivan/jenkinsnpm

To run this container on your machine, run this command:

- run from a command prompt: `docker run -d -p 49001:8080 -v $PWD/jenkins:/var/lib/jenkins -t chrisgallivan/jenkinsnpm:latest`


## Getting started
- open up a command prompt and cd to a local directory you have write access to (not the system folder)
- run from a command prompt: `docker run --name fcayeo -it --rm -v %CD%:/clocal fca-docker-apps.artifactory.intra.fcagroup.com/fcayeo-docker:latest`
- drink: a small coffee or espresso
- if your system does not permitted to use the local drive the use the: `docker cp localdir fcayeo:home/devusr/.aws/credentials' and 'docker cp localdir fcayeo:home/devusr/.aws/config'
- type: `yo` to access a list of available self-service tools 


## What do you get?

Freedom to setup your own Github repo and CI/CD pipeline. 

![](TimeforDevOps.jpg)

- Generator for creating a new Github repo: Here is the Link to the [Readme](https://github.intra.fcagroup.com/FCA-NIGHTS-WATCH/generator-create-github-repo/blob/master/README.md)
- Generator for storing and updating jenkins credentials for cloud deployment: Here is the Link to the [Readme](https://github.intra.fcagroup.com/FCA-NIGHTS-WATCH/generator-jenkins-creds/blob/master/README.md)
- Generator for configuring the pipeline: Here is the Link to the [Readme](https://github.intra.fcagroup.com/FCA-NIGHTS-WATCH/generator-pipeline-config/blob/master/README.md)
- Generator for importing infrastructure as code for AWS Lambda: Here is the Link to the [Readme](https://github.intra.fcagroup.com/FCA-NIGHTS-WATCH/generator-import-existing-lambda-state/blob/master/README.md)
- Generator for storing infrastructure current state in Artifactory: Here is the Link to the [Readme](https://github.intra.fcagroup.com/FCA-NIGHTS-WATCH/generator-terraform-state-init/blob/master/README.md)
- Access to the Enterprise CI/CD Pipeline. Here is the Link to the [Readme](README2.md)

## Currently Tested Services

AWS
- Lambda
- Lambda Layers

Azure
- Function App
- Function App Slot

## How To Guides
- How to onboard an AWS Lambda to the pipeline. [Readme](/examples/onboard_aws_lambda.md)
- How to onboard an Azure FunctionApp/Slot to the pipeline. [Readme](/examples/onboard_azure_function_app.md)

## Contributions
Help us make this better by making a pull request.

## Questions or Comments
Join our Google Chat Room (search for "Code Liberation Front") 
