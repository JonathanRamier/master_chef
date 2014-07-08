# Url downloads SonarQube & SonarRunner
default['sonarqube']['site'] 				= "http://sonarqube.org/"
default['sonarqube']['downloads']['version']= "4.3.1"
default['sonarqube']['downloads']['package']= "http://dist.sonar.codehaus.org/sonarqube-#{node['sonarqube']['downloads']['version']}.zip"
default['sonarqube']['downloads']['runner'] = "http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.4/sonar-runner-dist-2.4.zip"


# Path directory configuration
default["sonarqube"]["dir"]["conf"]  		= "/etc/sonarqube/"
default["sonarqube"]["dir"]["logs"] 		= "/var/log/sonarqube/"
default["sonarqube"]["dir"]["binary"]		= "/usr/local/bin/"
default["sonarqube"]["dir"]["home"] 		= "/usr/local/sonarqube/"
default["sonarqube"]["dir"]["temp"] 		= "/tmp/sonarqube/"


# Web Configuration
default["sonarqube"]["web"]["port"] 		= "9100"
default['sonarqube']["web"]['host']			= "0.0.0.0"


#Database Configuration
default["sonarqube"]["database"]["driver"] 	= "mysql"
default['sonarqube']["database"]['host']	= "localhost"
default["sonarqube"]["database"]["port"] 	= "3306"
default['sonarqube']["database"]['name']	= "sonar"
default['sonarqube']["database"]['user']	= "sonar"
default['sonarqube']["database"]['password']= "sonar"