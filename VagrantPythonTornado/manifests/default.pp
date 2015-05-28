class { 'python' :
  version    => 'system',
  pip        => true,
  dev        => true,
  virtualenv => true,
  gunicorn   => true,
}

python::pip { 'tornado':
  pkgname => 'tornado',
  ensure => 'latest'
}

#exec { 'install tornado':
#  command => '/bin/bash "/usr/bin/pip3 install tornado"',
#}


class { 'redis::install': }

redis::server {
  'instance':
    redis_memory => '1g',
    redis_ip => '0.0.0.0',
    redis_port => 6379,
    enabled => true
}

