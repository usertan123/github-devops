node {
    stage('git checkout'){
        git branch: 'main', credentialsId: 'ec2', url: 'git@github.com:usertan123/github-devops.git'
        sh 'ls -l'
    }
    stage('Docker build image'){
        sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID . --no-cache'
        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID tanmaytech/$JOB_NAME:v1.$BUILD_ID'
        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID tanmaytech/$JOB_NAME:latest'
    }
    stage('Pushing docker image to dockerhub'){
        withCredentials([string(credentialsId: 'dockerpassword', variable: 'password')]) {
        sh 'docker login -u tanmaytech -p ${password}'  
        sh 'docker image push tanmaytech/$JOB_NAME:v1.$BUILD_ID'
        sh 'docker image push tanmaytech/$JOB_NAME:latest'

        sh 'docker rmi $JOB_NAME:v1.$BUILD_ID tanmaytech/$JOB_NAME:v1.$BUILD_ID tanmaytech/$JOB_NAME:latest' 

        }
    }
    stage('docker container deployment'){
        def docker_run = 'docker run -itd --name scriptcontainer -p 9000:80 tanmaytech/$JOB_NAME'
        def docker_rmi = 'docker rmi -f tanmaytech/$JOB_NAME'
        def docker_rmv = 'docker rm -f scriptcontainer '
        sshagent(['webapp-node']) {
            sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.51.10 ${docker_rmi}"
            sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.51.10 ${docker_rmv}"
            sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.51.10 ${docker_run}"
        }
    }

}




// node {
//     stage('git checkout'){
//         git branch: 'main', url: 'https://github.com/usertan123/terra-jenkins.git'
//     }
//     stage ('Docker build image'){
//         sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID . --no-cache'
//         sh 'docker image tag $JOB_NAME:v1.$BUILD_ID tanmaytech/$JOB_NAME:v1.$BUILD_ID'
//         sh 'docker image tag $JOB_NAME:v1.$BUILD_ID tanmaytech/$JOB_NAME:latest'
//     }
//     stage ('Pushing images to dockerhub'){
//         withCredentials([string(credentialsId: 'DockerPasswd', variable: 'DockerPasswd')]) {
//         sh "docker login -u tanmaytech -p ${DockerPasswd}"
//         sh 'docker image push tanmaytech/$JOB_NAME:v1.$BUILD_ID'
//         sh 'docker image push tanmaytech/$JOB_NAME:latest'
        
//         sh 'docker image rm $JOB_NAME:v1.$BUILD_ID tanmaytech/$JOB_NAME:v1.$BUILD_ID tanmaytech/$JOB_NAME:latest'
//       }
//     }
//     stage ('Docker container Deployment '){
//         def docker_run = 'docker run -itd --name scriptcontainer -p 9000:80 tanmaytech/docker-groovy-webapp'
//         def docker_rmv_container = 'docker rm -f scriptcontainer'
//         def docker_rmi = 'docker rmi -f tanmaytech/docker-groovy-webapp'
//         sshagent(['webapp_server']) {
//             sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.2.71 ${docker_rmi}"
//             sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.2.71 ${docker_rmv_container}"
//             sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.2.71 ${docker_run}"
//         }
//     }
    
     
// }