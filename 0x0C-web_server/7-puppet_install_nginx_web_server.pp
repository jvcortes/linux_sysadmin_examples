# Installs and configures a nginx server
include 'stdlib'

package { 'nginx' :
  ensure   =>  'installed',
  name     =>  'nginx',
  provider =>  'apt'
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
  ensure   => 'running',
  name     => 'nginx',
  provider => 'systemd'
}
