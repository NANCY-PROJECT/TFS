pipeline {
    agent {
        node {
            label 'agent01'
        }
    }
    environment {
        APP_NAME = "myapp"
        APP_URL = "https://myapp.k8s-cluster.nancy.rid-intrasoft.eu"
        K8S_CREDS = "K8s-config-file"
    }

    stages {  
        // **************
        // *** Deploy ***
        // **************
        stage("Deployment"){
            steps {
               withKubeConfig([credentialsId: "${K8S_CREDS}"]) {
                   sh 'kubectl apply -f myapp-staging.yaml --validate=false'
               }
            }
        }

        // ****************************
        // *** Run Functional Tests ***
        // ****************************
     //   stage("Func Tests"){
       //     steps {
         //      echo "***** Running Functional Tests *****"
  //             sh 'sleep 60 && bash jenkins/tests/func_test.sh ${APP_URL}'
 //           }
 //       }
 //   }
    // post{
        // failure{
        //     // slackSend (color: "#FF0000", message: "Job FAILED: '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        //     sh 'docker image rm ${APP_NAME}:test &> /dev/null || True'
        //     sh 'DOCKER_TAG=test docker compose down --rmi all'
        // }

        // success{
        //     slackSend (color: "#008000", message: "Job SUCCESSFUL: '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        // }
    // }
}
