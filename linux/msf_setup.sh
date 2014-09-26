#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------
MSF_PASSWORD=$(< /dev/urandom tr -dc A-Za-z0-9 | head -c${1:-32})
MSF_PASSWORDTESTUSER=$(< /dev/urandom tr -dc A-Za-z0-9 | head -c${1:-32})
SYSTEM_RUBY_VERSION="ruby-2.1.3"
SYSTEM_RUBY_GEMSET="global"
MSF_PATH="/opt/metasploit"
#----------------------------------------------------------------------------------------------------------------------
ubuntu_log_info ()
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
#----------------------------------------------------------------------------------------------------------------------
install_deps () 
{
  apt-get update
  apt-get -y upgrade
  apt-get -y install build-essential \
                     zlib1g \
                     zlib1g-dev \
                     libxml2 \
                     subversion \
                     libxml2-dev \
                     libxslt-dev \
                     locate \
                     libreadline6-dev \
                     libcurl4-openssl-dev \
                     git-core \
                     libssl-dev \
                     libyaml-dev \
                     openssl \
                     autoconf \
                     libtool \
                     ncurses-dev \
                     bison \
                     curl \
                     wget \
                     postgresql \
                     postgresql-contrib \
                     libpq-dev \
                     libapr1 \
                     libaprutil1 \
                     libsvn1 \
                     libpcap-dev \
                     postgresql-client \
                     htop \
                     unzip \
                     lsof \
                     git-core \
                     git \
                     vim \
                     gawk \
                     libsqlite3-dev \
                     sqlite3 \
                     libgdbm-dev \
                     libffi-dev \
                     tree \
                     nmap
}
#----------------------------------------------------------------------------------------------------------------------
ubuntu_rvm ()
{
  curl -L https://get.rvm.io | sudo bash -s stable
  source /etc/profile.d/rvm.sh
  sudo usermod -a -G rvm $(whoami)
  rvm autolibs enable
  rvm install $SYSTEM_RUBY_VERSION
  rvm use $SYSTEM_RUBY_VERSION@$SYSTEM_RUBY_GEMSET --default --create
  ubuntu_log_info "Finished installing RVM!"
}
#----------------------------------------------------------------------------------------------------------------------
ubuntu_nano ()
{
  curl -sL https://raw.github.com/gen0cide-/pungi/master/nanorc | sudo tee /etc/nanorc > /dev/null
  ubuntu_log_info "Finished installing nano config!"
}
#----------------------------------------------------------------------------------------------------------------------
ubuntu_ps1 ()
{
  curl -sL https://raw.github.com/gen0cide-/pungi/master/linux/ubuntu_ps1_profile.sh | sudo tee /etc/profile.d/Z1_PS1.sh > /dev/null
  chmod +x /etc/profile.d/Z1_PS1.sh
  echo "" >> ~/.bashrc
  echo "source /etc/profile.d/Z1_PS1.sh" >> ~/.bashrc
  echo "" >> /etc/skel/.bashrc
  echo "source /etc/profile.d/Z1_PS1.sh" >> /etc/skel/.bashrc 
  source /etc/profile.d/Z1_PS1.sh
  ubuntu_log_info "Finished setting up global PS1 variable!"
}
#----------------------------------------------------------------------------------------------------------------------
setup_postgres () 
{
  service postgresql start
  sudo -u postgres psql -c "CREATE USER msfuser WITH PASSWORD '$1';"
  sudo -u postgres psql -c "CREATE USER msftest WITH PASSWORD '$2';"
  sudo -u postgres psql -c "CREATE DATABASE metasploit_framework_development;"
  sudo -u postgres psql -c "CREATE DATABASE metasploit_framework_test;"
  sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE metasploit_framework_development to msfuser;"
  sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE metasploit_framework_test to msftest;"
}
#----------------------------------------------------------------------------------------------------------------------
setup_msf () 
{
  cd $3
  bundle install
  for MSF in $(ls msf*); do
    echo "#!/usr/bin/env bash" > /usr/local/sbin/$MSF
    echo "rvm in $3 do $3/$MSF" >> /usr/local/sbin/$MSF
    chmod +x /usr/local/sbin/$MSF
  done
  cp $3/config/database.yml.example $3/config/database.yml
  sed -i 's/username: \metasploit_framework_development/username: msfuser/g' $3/config/database.yml
  sed -i 's/username: \metasploit_framework_test/username: msftest/g' $3/config/database.yml
  sed -i "s/__________________________________/$1/g" $3/config/database.yml
  sed -i "s/___________________________/$2/g" $3/config/database.yml
  echo "export MSF_DATABASE_CONFIG=$3/config/database.yml" >> ~/.bash_profile
  source ~/.bash_profile
}
#----------------------------------------------------------------------------------------------------------------------
supbrah () 
{
  echo " __  __ ____  _____ "
  echo "|  \/  / ___||  ___|"
  echo "| |\/| \___ \| |_   "
  echo "| |  | |___) |  _|  "
  echo "|_|  |_|____/|_|    "
  echo "Happy MSF nonsense  "
  echo "[*] MSF Location: $1"
  echo "[*] msf* executables already pathed into /usr/local/sbin"
  echo "[*] "
  echo "[!] NOTE: You will need to logout and log back in to finalize changes!!!"
  echo "[*] "
  echo "[*] Enjoy."
}
#----------------------------------------------------------------------------------------------------------------------
install_deps
ubuntu_rvm
ubuntu_nano
ubuntu_ps1
source /etc/profile.d/rvm.sh
setup_postgres $MSF_PASSWORD $MSF_PASSWORDTESTUSER
git clone https://github.com/rapid7/metasploit-framework $MSF_PATH
rvm install $(cat $MSF_PATH/.ruby-version)
setup_msf $MSF_PASSWORD $MSF_PASSWORDTESTUSER $MSF_PATH
supbrah $MSF_PATH
#----------------------------------------------------------------------------------------------------------------------
