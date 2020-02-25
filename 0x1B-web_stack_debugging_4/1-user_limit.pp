# sets the open files limit for the 'holberton' user

exec { 'set hard max open files' :
  command  => 'sed -i "/^holberton hard nofile [0-9]*/c\holberton hard nofile 10000" limits.conf',
  cwd      => '/etc/security',
  provider => 'shell'
}
-> exec { 'set soft max open files' :
  command  => 'sed -i "/^holberton soft nofile [0-9]*/c\holberton soft nofile 10000" limits.conf',
  cwd      => '/etc/security',
  provider => 'shell'
}
