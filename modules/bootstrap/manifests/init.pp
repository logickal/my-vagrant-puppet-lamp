class bootstrap { 
  # this makes puppet and vagrant shut up about the puppet group
  group { 'puppet':
    ensure => 'present'
  }

  # make sure the packages are up to date before beginning
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }

  # import bash_profile
  exec { "bash_root":
    command => "cat /vagrant/configfiles/bash_profile > /root/.bash_profile",
  }
  exec { "bash_vagrant":
    command => "cat /vagrant/configfiles/bash_profile > /home/vagrant/.bash_profile",
  }
}
