# What's this?
This is a set of configs and scripts to get a development environment for webapps online asap. 
It uses Vagrant to run a virtual machine in Virtual Box and Puppet provisioning to configure the box so that it runs... -wait for it- ...  out of the box!
It's all developped and tested on a Mac.

# Dependencies
- Vagrant
- Vagrant depends on Oracle's Virtual Box

# Package list
- apache2
- php5
- php5-cli
- php5-mysql
- php5-dev
- php5-gd
- mysql-server
- curl
- vim
- git-core


# Settings/Configs
## Global
- added LC_ALL=en.US-UTF8 to root & vragant .bash_profile to suppress mac terminal errors

## Apache
- mod rewrite enabled
- webroot: /vagrant/httpdocs
- apache2 runs as vagrant:vagrant (so access to shared folder is as expected)

## MySQL
- root password set
- default user: vagrant/vagrant


# Usage
## Install
1. Make sure you've got Vagrant & Virtual Box installed
2. git clone git://github.com/mcbrwr/my-vagrant-puppet-lamp.git mybox
3. Testing install: point your browser to http://localhost:8000

## Running your own website
1. make a subdir in mybox/sites/ (mkdir mybox/sites/mysite)
2. copy your site to the dir you created
3. point the httpdocs link to your site (rm mybox/httpdocs && ln -s mybox/sites/mysite mybox/httpdocs)
4. do your database stuff if needed..
5. check your site at http://localhost:8000

## doing stuff on the box's console
If you need access to the shell of the box do this: vagrant ssh. You're then logged in to the box as user vagrant.

