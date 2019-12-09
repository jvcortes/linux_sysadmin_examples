# Creates a file in /tmp/ with 0744 permissions and ownership from the user and group 'www-data'
file { '/tmp/holberton':
  path    =>   '/tmp/holberton',
  mode    =>   '0744',
  owner   =>   'www-data',
  group   =>   'www-data',
  content =>   'I love Puppet'
}
