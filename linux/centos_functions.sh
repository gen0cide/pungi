PUNGI_RUBY_VERSION="2.0.0-p247"
PUNGI_DEFAULT_GEMSET="base"
# -----------------------------------------------------------------------------
centos_log_info ()
{
  RED="\033[0;31m"
  YELLOW="\033[0;33m"
  GREEN="\033[0;32m"
  GRAY="\033[1;30m"
  LIGHT_GRAY="\033[0;37m"
  CYAN="\033[0;36m"
  LIGHT_CYAN="\033[1;36m"
  NO_COLOUR="\033[0m"
  echo -e "$RED[*] $YELLOW$1$NO_COLOUR"
}
# -----------------------------------------------------------------------------
centos_packages ()
{
  sudo yum -y install gcc-c++ patch readline readline-devel zlib zlib-devel 
  sudo yum -y install libyaml-devel libffi-devel openssl-devel make 
  sudo yum -y install bzip2 autoconf automake libtool bison iconv-devel
  sudo yum -y install git-core htop openssl lsof zip unzip
  centos_log_info "Finished installing centos packages!"
}
# -----------------------------------------------------------------------------
centos_rvm ()
{
  curl -L https://get.rvm.io | sudo bash -s stable
  source /etc/profile.d/rvm.sh
  sudo usermod -a -G rvm $(whoami)
  rvm autolibs enable
  rvm install $PUNGI_RUBY_VERSION
  rvm use $PUNGI_RUBY_VERSION@$PUNGI_DEFAULT_GEMSET --default --create
  centos_log_info "Finished installing RVM!"
}
# -----------------------------------------------------------------------------
centos_nano ()
{
  curl -sL https://raw.github.com/gen0cide-/pungi/master/nanorc | sudo tee /etc/nanorc > /dev/null
  centos_log_info "Finished installing nano config!"
}
# -----------------------------------------------------------------------------
centos_ps1 ()
{
  curl -sL https://raw.github.com/gen0cide-/pungi/master/linux/centos_ps1_profile.sh | sudo tee /etc/profile.d/Z1_PS1.sh > /dev/null
  chmod +x /etc/profile.d/Z1_PS1.sh
  echo "" >> ~/.bashrc
  echo "source /etc/profile.d/Z1_PS1.sh" >> ~/.bashrc
  echo "" >> /etc/skel/.bashrc
  echo "source /etc/profile.d/Z1_PS1.sh" >> /etc/skel/.bashrc 
  source /etc/profile.d/Z1_PS1.sh
  centos_log_info "Finished setting up global PS1 variable!"
}
# -----------------------------------------------------------------------------
centos_packages
centos_rvm
centos_nano
centos_ps1
# -----------------------------------------------------------------------------
centos_log_info "IMPORTANT! You must source /etc/profile for this to function successfully!"
# -----------------------------------------------------------------------------