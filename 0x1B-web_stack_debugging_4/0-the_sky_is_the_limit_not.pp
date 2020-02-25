# Sets nginx ulimit for open files.
exec { 'set nginx ulimit':
  command  => 'sed -i "/^ULIMIT=\"-n [0-9]*\"/c\ULIMIT=\"-n 1000\"" nginx',
  cwd      => '/etc/default',
  provider => shell
}
-> exec { 'restart nginx':
  command  => 'service nginx restart',
  provider => 'shell'
}
