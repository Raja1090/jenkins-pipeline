class Code
  
  pipeline{
    agent any
    stage{
      satage('compile stage'){
        steps{
          with maven {maven :maven-3-3.9} {
          sh 'mvn clean install' 
        }
      }
      }
    satage('metrics stage'){
            steps{
              with maven {maven :maven-3-3.9} {
              sh 'mvn -p metrics pmd:pmd' 
            }
          }
          }
  satage('Testing  stage'){
             steps{
               with maven {maven :maven-3-3.9} {
               sh 'mvn test ' 
             }
           }
           }
satage('Testing  stage'){
             steps{
               with maven {maven :maven-3-3.9} {
               sh 'mvn test ' 
             }
           }
           }
satage('Packaging stage'){
             steps{
               with maven {maven :maven-3-3.9} {
               sh 'mvn package' 
             }
           }
           }
satage('deploying  tomcat'){
             steps{
               sshagent {('jenkins id')} {
               sh 'scp target/application.war guest@ip:/var/lib/tomcat/webapps/'
               
               }
               
           }
           }
    }
  }
  
end