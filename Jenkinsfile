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
		stage('çheckout') {
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
		 }
	  }
	}
	post {
        always {
            junit 'build/reports/**/*.xml'
        }
    }
}