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
				echo "Start Spring Boot Application!"
				CURRENT_PID=\$(ps -ef | grep java | grep testPipeline | awk '{print \$2}')
				echo "\$CURRENT_PID"
				if [ -z "\$CURRENT_PID" ]; then
				    echo "> 현재 구동중인 어플리케이션이 없으므로 종료하지 않습니다."
				else
				    echo "> kill -9 \$CURRENT_PID"
				    su kill -9 \$CURRENT_PID
				    sleep 10
				fi
				echo "> 어플리케이션 배포 진행!"

				java -jar /var/lib/jenkins/workspace/testPipeline/build/libs/demo-0.0.1-SNAPSHOT.jar &

				echo "배포까지 성공 !!"
				"""
		}
		}
	}
	
	

}