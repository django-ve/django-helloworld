pipeline {
       agent any

        stage('git clone'){
            steps {
                git(
                url:  'git@github.com:mkpmanish/django-helloworld.git',
                branch: 'master',
                changelog: true,
                poll: true
                )
            }
        }


        stage('build'){
            agent { 
		docker { 
			image 'python:3.9.19-alpine3.20' 
			 }
		}
            steps {
                echo 'Running Build Stage.........'
                sh 'ls -ltr'
                sh 'docker build -t myhellopy .'
                sh 'docker run -p 8888:8888 -d myhellopy'
            }
        }
        stage('test'){
            steps{
                sh 'sleep 20'
                sh 'curl http://$(curl http://checkip.amazonaws.com):8888/'
            }
        }
        stage('run_sca'){
            steps{
                echo 'Run SCA safety check'
                sh 'docker run -v "$PWD:/src" hysnsec/safety check -r requirements.txt --json > output.json'

            }
        }
    }
}
