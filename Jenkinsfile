pipeline {

  environment {
    PROJECT = "focus-tree-329108"
    APP_NAME = "dinesh"
    FE_SVC_NAME = "${APP_NAME}-frontend"
    CLUSTER = "false"
    CLUSTER_ZONE = "us-central1-c"
    IMAGE_TAG = "gcr.io/${PROJECT}/${APP_NAME}:${env.BRANCH_NAME}.${env.BUILD_NUMBER}"
    JENKINS_CRED = "${PROJECT}"
  }

  agent {
    kubernetes {
      inheritFrom 'sample-app'
      defaultContainer 'jnlp'
      yaml """
apiVersion: v1
kind: Pod
metadata:
labels:
  component: ci
spec:
  # Use service account that can deploy to all namespaces
 # serviceAccountName: cd-jenkins
  containers:
  - name: maven
    image: maven:latest
    command:
    - cat
    tty: true
  - name: maven
    image: gcr.io/google.com/cloudsdktool/cloud-sdk
    command:
    - cat
    tty: true
  - name: kubectl
    image: maven:latest
    command:
    - cat
    tty: true
"""
}
  }
  stages {
    stage('Test') {
      steps {
        container('maven') {
          sh """
            ln -s `pwd` /mvn/src/sample-app
            cd /mvn/src/sample-app
            clean install
          """
        }
      }
    }
    stage('Build and push image with Container Builder') {
      steps {
        container('gcloud') {
          sh "JAVABUFFERED=1 gcloud builds submit -t ${IMAGE_TAG} ."
        }
      }
    } 
    stage('Deploy Dev') {
      steps {
        container('kubectl') {
         
        }
      }
    }
  }
}
