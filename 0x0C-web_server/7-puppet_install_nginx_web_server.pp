# Installs and configures a nginx server
include 'stdlib'

exec { 'install nginx' :
  command  => 'sudo apt-get -y install nginx',
  provider => 'shell'
}

package { 'nginx' :
  ensure =>  'present',
  name   =>  'nginx',
}

file { 'index.html' :
  path    =>  '/var/www/html/index.html',
  content =>  'Holberton School',
}

file_line { 'set-redirect' :
  ensure => present,
  path   => '/etc/nginx/sites-enabled/default',
  after  => "\tserver_name _;",
  line   => "  rewrite ^/redirect_me/?(.*)$ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;"
}

service { 'nginx' :
  ensure => 'running',
  name   => 'nginx'
}
