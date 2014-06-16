default['sonarqube']['site'] 				= "http://sonarqube.org/"
default['sonarqube']['downloads']['file'] 	= "http://dist.sonar.codehaus.org/sonarqube-4.3.1.zip"
default['sonarqube']['downloads']['runner'] = "http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.4/sonar-runner-dist-2.4.zip"

default["sonarqube"]["conf"]["dir"]  		= "/etc/sonar/"
default["sonarqube"]["listen_ports"] 		= [ "9100" ]

default["sonarqube"]["logs_path"] 			= "/var/log/sonarqube/"
default["sonarqube"]["binary_dir"] 			= "/usr/local/bin/"
default["sonarqube"]["home_path"] 			= "/usr/local/sonarqube/"
default['sonarqube']['web_host']			= "0.0.0.0"