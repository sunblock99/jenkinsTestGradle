pipeline{
	agent any
	
	stages{
		stage("Pull Codes from Github"){
		    steps{
			checkout scm
		    }
		}
		stage("Connect test"){
		    steps{
			sh """
			echo connect test			  
			"""
		    }
		}
		stage("Build Codes By Gradle"){
		    steps{
		        sh """
		        chmod +x gradlew
		        ./gradlew clean build
		        """
		    }
		}
		stage("Deploy"){
			steps{
			sh """
				chmod +x deploy.sh
				./deploy.sh
				"""
		}
		}
	}
	
	

}