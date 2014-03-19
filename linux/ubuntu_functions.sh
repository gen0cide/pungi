PUNGI_RUBY_VERSION="2.1.0"
PUNGI_DEFAULT_GEMSET="base"
# -----------------------------------------------------------------------------
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
# -----------------------------------------------------------------------------
ubuntu_packages ()
{
  sudo apt-get -y update
  sudo apt-get -y upgrade
  sudo apt-get -y install build-essential    \
                          openssl            \
                          libreadline6       \
                          libreadline6-dev   \
                          libncurses-dev     \
                          libffi-dev         \
                          libgdbm-dev        \
                          zlib1g             \
                          zlib1g-dev         \
                          libssl-dev         \
                          libyaml-dev        \
                          libsqlite3-0       \
                          libsqlite3-dev     \
                          sqlite3            \
                          libxml2-dev        \
                          libxslt1-dev       \
                          autoconf           \
                          libc6-dev          \
                          automake           \
                          libtool            \
                          git-core           \
                          curl               \
                          libmysqlclient-dev \
                          unzip              \
                          zip                \
                          htop               \
                          finger             \
                          multitail          \
                          postgresql-client  \
                          libpq5             \
                          libpq-dev          \
                          lsof               
  ubuntu_log_info "Finished installing Ubuntu packages!"
}
# -----------------------------------------------------------------------------
ubuntu_rvm ()
{
  curl -L https://get.rvm.io | sudo bash -s stable
  source /etc/profile.d/rvm.sh
  sudo usermod -a -G rvm $(whoami)
  rvm autolibs enable
  rvm install $PUNGI_RUBY_VERSION
  rvm use $PUNGI_RUBY_VERSION@$PUNGI_DEFAULT_GEMSET --default --create
  ubuntu_log_info "Finished installing RVM!"
}
# -----------------------------------------------------------------------------
ubuntu_nano ()
{
  curl -sL https://raw.github.com/gen0cide-/pungi/master/nanorc | sudo tee /etc/nanorc > /dev/null
  ubuntu_log_info "Finished installing nano config!"
}
# -----------------------------------------------------------------------------
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
# -----------------------------------------------------------------------------
ubuntu_packages
ubuntu_rvm
ubuntu_nano
ubuntu_ps1
# -----------------------------------------------------------------------------
ubuntu_log_info "IMPORTANT! You must source /etc/profile for this to function successfully!"
# -----------------------------------------------------------------------------
