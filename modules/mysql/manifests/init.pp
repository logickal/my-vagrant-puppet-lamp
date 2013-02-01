class mysql {
  $mysqluser   = "vagrant"
  $mysqlpw     = "vagrant"
  $mysqlrootpw = "qwe123"

  package { "mysql-server":
    ensure => present,
    require => Exec["apt-get update"]
  }

  service { "mysql":
    ensure => running,
    require => Package["mysql-server"],
  }

  exec { "set-mysql-root-password":
    unless => "mysqladmin -uroot -p$mysqlrootpw status",
    command => "mysqladmin -uroot password $mysqlrootpw",
    require => Service["mysql"],
  }
  exec { "set-mysql-password":
    unless => "mysqladmin -u$mysqluser -p$mysqlpw status",
    command => "echo \"GRANT ALL ON *.* TO '$mysqluser'@'%' IDENTIFIED BY '$mysqlpw'\" | mysql -uroot -p$mysqlrootpw",
    require => Service["mysql"],
  }
  
}
