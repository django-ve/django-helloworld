pipeline {
    agent none
    stages {
	stage('Build App'){
		agent any
		steps {
			git(
        		        url:  'git@github.com:mkpmanish/django-helloworld.git',
             			   branch: 'master',
               			 changelog: true,
               			 poll: true
                	)
			sh 'grep -ri 8888 *'
			sh 'uname -a'
			sh 'hostname'
			sh 'docker build -t myhellopy .'
			sh 'docker run -p 8800:8800 -d myhellopy'
			sh 'sleep 10'
			sh 'curl http://$(curl http://checkip.amazonaws.com):8800/'
		  		
		}
	}

        stage("Run SCA"){
                agent any
                steps { script{
                   try{
                        echo "Runing SCA scan..........."
                        sh 'docker run -v "$PWD:/src" hysnsec/safety check -r requirements.txt'

                } catch(Exception e){
                        echo "Scan failed for some reason...." + e.getMessage()
                }}
           }
        }

        stage("Run SAST - Bandit"){
                agent any
                steps { script{
                   try{
                        echo "Runing SCA scan..........."
                        sh 'docker run --user $(id -u):$(id -g) -v $PWD:/src:rw cytopia/bandit -r -f json -o /src/bandit.json /src'
			sh 'ls -ltr /src/bandit.json'
                } catch(Exception e){
                        echo "Bandit Scan failed for some reason...." + e.getMessage()
                }}
           }
        }


	stage("Run ZAP"){
		agent any
		steps{
			script{
			   try{	
				sh 'docker run -t  -v /tmp:/zap/wrk:rw --rm  ghcr.io/zaproxy/zaproxy:stable zap-baseline.py -t http://$(curl http://checkip.amazonaws.com):8800/ -J output.json'
			   } catch (Exception e) { 
				echo "Scan failed for some reason...." + e.getMessage()	
			   }	
			}
		}
	}


	stage("Cleanup"){
		agent any
		steps{
			sh 'if [ $(docker ps | awk \'{print $1}\' | tail -1) ];then docker stop $(docker ps | awk \'{print $1}\' | tail -1);fi'
		}
	}
    }
}
