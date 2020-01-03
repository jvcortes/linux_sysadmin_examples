# Configures a nginx custom header

exec { 'install nginx' :
  command  => 'sudo apt-get -y install nginx',
  provider => 'shell'
}

package { 'nginx' :
  ensure =>  'present',
  name   =>  'nginx',
}

exec { 'set custom header' :
  command  => "sudo sed -i \"47 i \tadd_rule X-Served-By $(hostname);\"\
  /etc/nginx/sites-enabled/default",
  provider => 'shell'
}

service { 'nginx' :
  ensure => 'running',
  name   => 'nginx'
}
