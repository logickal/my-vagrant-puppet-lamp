class mysql {
  $mysqluser   = "vagrant"
  $mysqlpw     = "vagrant"
  $mysqldb     = "vagrant"
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
  exec { "createdb":
    unless => "mysqlshow -u$mysqluser -p$mysqlpw $mysqldb",
    command => "mysqladmin -u$mysqluser -p$mysqlpw create $mysqldb",
    require => Exec["set-mysql-password"],
  }

}
