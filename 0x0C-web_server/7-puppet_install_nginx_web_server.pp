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

exec { 'create index file' :
  command  => 'echo "Holberton School" | sudo tee /var/www/html/index.html',
  provider => 'shell'
}

exec { 'set redirect' :
  command  => "sudo sed -i '46 i \trewrite ^/redirect_me/?(.*)$  \
  https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;' \
  /etc/nginx/sites-enabled/default",
  provider => 'shell'
}

service { 'nginx' :
  ensure => 'running',
  name   => 'nginx'
}
