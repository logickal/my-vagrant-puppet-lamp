class other {
  $packages = ["curl", "vim", "git-core"]
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
  
  # fix console  warnings in mac terminal
  exec { "bash_root":
    command => "echo 'export LC_CTYPE=\"en_US.UTF-8\"' > /root/.bash_profile",
  }
  exec { "bash_vagrant":
    command => "echo 'export LC_CTYPE=\"en_US.UTF-8\"' > /home/vagrant/.bash_profile",
  }
}
