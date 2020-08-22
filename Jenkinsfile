pipeline{
	agent any
	tools {
		maven 'Maven'
	}
	options {
		timestamps()
		timeout(time: 1, unit: 'HOURS')
		skipDefaultCheckout()
		buildDiscarder(logRotator(daysToKeepStr: '10', numToKeepStr: '10'))
		disableConcurrentBuilds()
	}
	stages {
		stage('Checkout') {
		  steps{
			echo "build in master branch -1"
			checkout scm
		  }
		}
		stage('build') {
		  steps{
			echo "build in master branch -2"
			bat "mvn install"
		  }
		}
		stage('unit testing'){
		  steps{
		   echo "Unit Testing"
		   bat "mvn test"
		  }
		}
		
	  stage('Sonar analysis'){
		steps{
		   withSonarQubeEnv("localSonar")
		   {
			 bat "mvn sonar:sonar"
		   }
		  }
	  }
	  stage('Upload to artifactory'){
	  
		steps{
			rtMavenDeployer(
			  id: 'deployer',
			  serverId: 'demoArtifactory',
			  releaseRepo: 'demoArtifactory',
			  snapshotRepo: 'demoArtifactory'
			)
			rtMavenRun (
	          pom: 'pom.xml',
	          goals: 'clean install',
	          deployerId: 'deployer',
            )
			rtPublishBuildInfo(
			   serverId:'demoArtifactory'
			)
		}
	  }
	  stage('Docker Image'){
	    steps{
		    bat 'docker build --network=host --no-cache -t heenamittal11/demo-application:%BUILD_NUMBER% -f Dockerfile .'
		}
	  }
	  stage('Push to DTR'){
	    steps{
		    bat 'docker push heenamittal11/demo-application:%BUILD_NUMBER%'
		}
	  }
	  stage('Stop Running Container'){
	    steps{
		   bat '''
		   ContainerId=$(docker ps | grep 7000 | cut -d " " -f 1)
		   if [$ContainerId]
		   then
		       docker stop $ContainerId
			   docker rm -f $ContainerId
		   fi
		   '''
		}
	  }
	  stage('Docker Deployment'){
	    steps{
		  bat 'docker run --name demo-application -d -p 7000:9100 heenamittal11/demo-application:%BUILD_NUMBER%'
		}
	  }
	}
	 
	post {
        always {
            junit 'target/surefire-reports/*.xml'
        }
    }
}