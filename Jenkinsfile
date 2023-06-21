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
		        ./gradlew build
		        """
		    }
		}
		stage("Deploy"){
			steps{
			sh """

				nohup java -jar /var/lib/jenkins/workspace/testPipeline/build/libs/demo-0.0.1-SNAPSHOT.jar &

				echo 배포까지 성공 !!

			"""
		}
		}
	}
	
	

}