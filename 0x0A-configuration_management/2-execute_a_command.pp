# Kills the process with the name 'killmenow'

exec { 'killall' :
  path     =>   ['/usr/bin', '/sbin/', '/bin/', '/usr/sbin'],
  provider =>   'shell',
  command  =>   'pkill killmenow'
}

