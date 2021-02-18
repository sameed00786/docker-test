pipeline
{
    agent any
    environment{
          PATH = "/opt/maven/apache-maven-3.6.3/bin:$PATH"
      }
    stages
	{
	    stage('SCM GitCheckout'){
	        steps{
		    git credentialsId: '4c0c0f02-76fc-4468-8bac-dac2c947c918', url: 'https://github.com/sameed00786/java1.git'
		    }
		  }
		stage('maven test'){
		    steps{
	            sh "mvn --version"
		        sh "mvn clean test surefire-report:report"
		        }
            }
        stage('Test Case and Reports'){
            steps{
                echo "executing the test cases"
                junit allowEmptyResults: true, testResults: '/var/lib/jenkins/workspace/automate_java_app/target/surefire-reports/*.xml'
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/automate_java_app/target/site', reportFiles: 'surefire-report.html', reportName: 'SureFireReportsHTML', reportTitles: ''])
            }
	    }
	    stage('Package and Generate artifacts'){
	        steps{
	            sh "mvn clean package -DskipTests=true"
	            archiveArtifacts allowEmptyArchive: true, artifacts: '/var/lib/jenkins/workspace/automate_java_app/target/**/*.war', followSymlinks: false
	        }
	    }
	    stage('deployment of Application using Docker'){
	        steps{
	            sh "docker version"
	            sh "cd /opt/docker; docker build  -t sameed00786/tomcat_war:newtag -f Dockerfile ."
	            sh "docker run -p 8090:8080 -d sameed00786/tomcat_war:newtag"
                //withDockerRegistry(credentialsId: '0de378f2-49bd-403f-9e94-367882076ea0', url: 'https://hub.docker.com/u/sameed00786') {
                //sh "docker push sameed00786/tomcat_war:newtag"
                }
	    }
        }
    }
}
