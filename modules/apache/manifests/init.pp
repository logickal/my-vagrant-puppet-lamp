class apache {
  package { "apache2":
    ensure => present,
    require => Exec["apt-get update"]
  }

  # ensures that mode_rewrite is loaded and modifies the default configuration file
  file { "/etc/apache2/mods-enabled/rewrite.load":
    ensure => link,
    target => "/etc/apache2/mods-available/rewrite.load",
    require => Package["apache2"]
  }

  file { "/etc/apache2/sites-available/default":
    ensure => present,
    source => "/vagrant/configfiles/apache_vhost",
    require => Package["apache2"]
  }

  file { "/etc/apache2/sites-enabled/default":
    ensure => link,
    target => "/etc/apache2/sites-available/default",
    require => File["/etc/apache2/sites-available/default"]
  }
  exec { "update_apache_user":
    command => "sed -i 's/www-data/vagrant/g' /etc/apache2/envvars"
  }
  exec { "update_apache_lockfile":
    command => "chown vagrant:vagrant /var/lock/apache2"
  }

  # starts the apache2 service once the packages installed, and monitors changes to its configuration files and reloads if nesessary
  service { "apache2":
    ensure => running,
    require => Package["apache2"],
    subscribe => [
      File["/etc/apache2/mods-enabled/rewrite.load"],
      File["/etc/apache2/sites-available/default"]
    ],
  }
}
