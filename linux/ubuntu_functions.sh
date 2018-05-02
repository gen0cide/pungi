# -----------------------------------------------------------------------------
PUNGI_RUBY_VERSION="2.5.1"
PUNGI_NODE_VERSION="10.0"
PUNGI_GO_VERSION="go1.10"
PUNGI_DEFAULT_GEMSET="base"
# -----------------------------------------------------------------------------
ubuntu_log_info ()
{
  echo ""
  echo "######################################################################"
  echo "#"
  echo "# <$(date)> $1"
  echo "#"
  echo "######################################################################"
  echo ""
}
# -----------------------------------------------------------------------------
ubuntu_packages ()
{
  sudo apt -y update
  sudo apt -y upgrade
  sudo apt -y install build-essential    \
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
                      lsof               \
                      libjemalloc-dev    \
                      libgmp-dev         \
                      graphviz           \
                      traceroute         \
                      dnsutils           \
                      libmagic-dev       \
                      upstart            \
                      bison              \
                      python-software-properties
  ubuntu_log_info "Finished installing Ubuntu packages!"
}
# -----------------------------------------------------------------------------
ubuntu_rvm ()
{
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  curl -L https://get.rvm.io | sudo bash
  sudo usermod -a -G rvm $(whoami)
  source /etc/profile.d/rvm.sh
  source /etc/profile
  rvmsudo rvm autolibs enable
  ubuntu_log_info "Finished installing RVM!"
}
# -----------------------------------------------------------------------------
ubuntu_nano ()
{
  curl -sL https://raw.github.com/gen0cide-/pungi/master/nanorc | sudo tee /etc/nanorc > /dev/null
  ubuntu_log_info "Finished installing nano config!"
}
# -----------------------------------------------------------------------------
ubuntu_gvm ()
{
  ubuntu_log_info "Installing GVM and Golang runtimes"
  curl -o gvm_setup.sh -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer
  bash gvm_setup.sh
  echo ""
  source /root/.gvm/scripts/gvm
  CGO_ENABLED=0 gvm install go1.4
  gvm use go1.4
  gvm install $PUNGI_GO_VERSION
  gvm use $PUNGI_GO_VERSION --default
  rm gvm_setup.sh
  ubuntu_log_info "Finished Golang deployment"
}
# -----------------------------------------------------------------------------
ubuntu_nvm ()
{
  ubuntu_log_info "Installing NVM and NodeJS runtimes"
  curl -o nvm_setup.sh 'https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh'
  bash nvm_setup.sh
  source /root/.nvm/nvm.sh
  nvm install $PUNGI_NODE_VERSION
  nvm use $PUNGI_NODE_VERSION
  nvm alias default $PUNGI_NODE_VERSION
  rm nvm_setup.sh
  ubuntu_log_info "Finished NodeJS deployment"
}
# -----------------------------------------------------------------------------
ubuntu_ps1 ()
{
  curl -sL https://raw.github.com/gen0cide-/pungi/master/linux/ubuntu_ps1_profile.sh | sudo tee /etc/profile.d/Z1_PS1.sh > /dev/null
  sudo chmod +x /etc/profile.d/Z1_PS1.sh
  echo "" >> ~/.bashrc
  echo "source /etc/profile.d/Z1_PS1.sh" >> ~/.bashrc
  echo "" | sudo tee /etc/skel/.bashrc > /dev/null
  echo "source /etc/profile.d/Z1_PS1.sh" | sudo tee /etc/skel/.bashrc > /dev/null
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
source /etc/profile
rvm install $PUNGI_RUBY_VERSION -C --with-jemalloc
rvm use $PUNGI_RUBY_VERSION@$PUNGI_DEFAULT_GEMSET --default --create
touch /root/.hushlogin
# -----------------------------------------------------------------------------
ubuntu_nvm
ubuntu_gvm
# -----------------------------------------------------------------------------
