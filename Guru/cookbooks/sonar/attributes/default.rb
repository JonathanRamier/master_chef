# Url downloads SonarQube & SonarRunner
default['sonarqube']['site'] 				= "http://sonarqube.org/"
default['sonarqube']['downloads']['package']= "http://dist.sonar.codehaus.org/sonarqube-4.3.1.zip"
default['sonarqube']['downloads']['runner'] = "http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.4/sonar-runner-dist-2.4.zip"


# Path directory configuration
default["sonarqube"]["dir"]["conf"]  		= "/etc/sonarqube/"
default["sonarqube"]["dir"]["logs"] 		= "/var/log/sonarqube/"
default["sonarqube"]["dir"]["binary"]		= "/usr/local/bin/"
default["sonarqube"]["dir"]["home"] 		= "/usr/local/sonarqube/"
default["sonarqube"]["dir"]["temp"] 		= "/temp/sonarqube/"

# Web Configuration
default["sonarqube"]["web"]["port"] 		= "9100"
default['sonarqube']["web"]['host']			= "0.0.0.0"