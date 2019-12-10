# Edits ~/.ssh/config to refuse to authenticate to a server by its password

$file = file('/etc/ssh/ssh_config')
$str = "Host 35.237.10.249\nIdentityFile ~/.ssh/holberton\n"
$contents = $file

unless $str in $file {
  $_contents = "${contents}${str}"
}

file { '/etc/ssh/ssh_config':
  path    =>    '/etc/ssh/ssh_config',
  content =>    $_contents
}
