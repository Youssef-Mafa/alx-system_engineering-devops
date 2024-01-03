# configure an Nginx

package{ 'nginx':
  ensure => 'installed',
}

service{ 'nginx':
  ensure => 'running',
  enable => 'true',
}

file {'/var/www/html/index.html':
  ensure => 'file',
  content => 'Hello World!',
  require => Package['nginx'],
  notify => Service['nginx'],
  }

file {'/var/www/html/404.html':
  ensure => 'file',
  content => "Ceci n'est pas une page",
  require => Package['nginx'],
  notify => Service['nginx'],}
