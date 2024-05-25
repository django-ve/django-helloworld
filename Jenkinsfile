pipeline {
    agent none
    stages {
        stage('Back-end') {
            agent {
                docker { image 'maven:3.9.6-eclipse-temurin-17-alpine' }
            }
            steps {
                sh 'mvn --version'
            }
        }
        stage('Front-end') {
            agent {
                docker { image 'node:20.11.1-alpine3.19' }
            }
            steps {
                sh 'node --version'
            }
        }
	stage('Build App'){
		agent any
		steps {
			git(
        		        url:  'git@github.com:mkpmanish/django-helloworld.git',
             			   branch: 'master',
               			 changelog: true,
               			 poll: true
                	)
			sh 'uname -a'
			sh 'hostname'
			sh 'docker build -t myhellopy .'
			sh 'docker run -p 8888:8888 -d myhellopy'
			sh 'curl http://$(curl http://checkip.amazonaws.com):8888/'
		  		
		}
	}
    }
}
