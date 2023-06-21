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
			sh """
				echo "Start Spring Boot Application!"

				def process = "ps -ef".execute()
				def processOutput = process.text

				def CURRENT_PID = processOutput.readLines().findAll { line ->
   				 line.contains("java") && line.contains("jenkinsTestGradle")
				}.collect { line ->
   				 line.tokenize()[1]
				}

				echo "$CURRENT_PID"

				if (CURRENT_PID.empty) {
  			  echo "> Currently, there is no running application, so it won't be terminated."
				} else {
 			   echo "> kill -9 $CURRENT_PID"
 				   "kill -9 $CURRENT_PID".execute()
  				  sleep(10)
				}

				echo "> Proceed with application deployment!"
				"nohup java -jar /var/lib/jenkins/workspace/jenkinsTestGradle/build/libs/demo-0.0.1-SNAPSHOT.jar &".execute()
				echo "Successful deployment!"				

			"""
		}
		
	}
	
	

}