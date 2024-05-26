pipeline {
    agent none
    stages {
	  stage("Pre-cleanup"){
		agent any
		steps{
			sh 'docker stop $(docker ps | awk "{print $1}" | tail -1)'
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
			sh 'sleep 10'
			sh 'curl http://$(curl http://checkip.amazonaws.com):8888/'
		  		
		}
	}
	stage("Run ZAP"){
		agent any
		steps{
			script{
			   try{	
				sh 'docker run -t  -v /tmp:/zap/wrk:rw --rm  ghcr.io/zaproxy/zaproxy:stable zap-baseline.py -t http://$(curl http://checkip.amazonaws.com):8888/ -J output.json'
			   } catch (Exception e) { 
				echo "Scan failed for some reason...." + e.getMessage()	
			   }	
			}
		}
	}
	stage("Run SCA"){
		agent any
		steps {
			sh 'docker run -v "$PWD:/src" hysnsec/safety check -r requirements.txt --json > output.json'
		}
	}
	stage("Cleanup"){
		agent any
		steps{
			sh 'if [ $(docker ps | awk "{print $1}" | tail -1) ];then docker stop $(docker ps | awk "{print $1}" | tail -1);fi'
		}
	}
    }
}
