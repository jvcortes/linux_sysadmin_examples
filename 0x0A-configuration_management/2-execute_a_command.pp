# Kills the process with the name 'killmenow'

exec { 'killmenow' :
  path     =>   ['/usr/bin', '/sbin/', '/bin/', '/usr/sbin'],
  provider =>   'shell',
  command  =>   'pkill killmenow'
}

