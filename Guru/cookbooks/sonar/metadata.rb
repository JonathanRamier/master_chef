name             'sonar'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'jonathan.ramier@live.fr'
license          'All rights reserved'
description      'Installs/Configures sonar'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'
supports 'debian'

depends 'open-java-jdk'
depends 'mysql'