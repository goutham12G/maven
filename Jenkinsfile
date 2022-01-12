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
  - name: goutham
    image: maven:3.6.3-jdk-8
    command:
    - cat
    tty: true
  - name: goutham
    image: gcr.io/google.com/cloudsdktool/cloud-sdk
    command:
    - cat
    tty: true
  - name: kubectl
    image: maven:3.6.3-jdk-8
    command:
    - cat
    tty: true
"""
}
  }
 # stages {
    stage('build') {
      steps {
        container('maven') {
          sh """
            maven clean install
          """
        }
      }
    }
    stage('Build and push image with Container Builder') {
      steps {
        container('gcloud') {
          sh "PYTHONBUFFERED=1 gcloud builds submit -t ${IMAGE_TAG} ."
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
