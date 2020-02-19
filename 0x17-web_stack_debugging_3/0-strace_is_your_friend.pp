# Fixes an Apache2 HTTPD installation with WordPress sourcing the
# correspondant environment variables and fixing a typo in one of
# the required WordPress files at the WordPress settings file.
exec { 'source envvars' :
  command  => '. /etc/apache2/envvars',
  provider => shell
}

exec { 'fix filename typo':
  command  => 'sed -i "s/.phpp/.php/g" wp-settings.php',
  cwd      => '/var/www/html/',
  provider => shell
}

service { 'apache2' :
  ensure => true,
  name   => 'apache2'
}
