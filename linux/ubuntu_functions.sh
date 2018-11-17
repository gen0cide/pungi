# -----------------------------------------------------------------------------
PUNGI_RUBY_VERSION="2.5.3"
PUNGI_NODE_VERSION="11.2"
PUNGI_GO_VERSION="go1.11"
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
  sudo apt-get -y update
  sudo apt-get -y upgrade
  sudo apt-get -y install build-essential    \
                          openssl            \
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
                          bison              
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
  curl -o /tmp/golang.tgz "https://storage.googleapis.com/golang/${PUNGI_GO_VERSION}.linux-amd64.tar.gz"
  mkdir /opt/go
  tar xzf /tmp/golang.tgz -C /usr/local
  cat <<EOF >/etc/environment
  GOPATH="/opt/go"
  GOROOT="/usr/local/go"
  PATH="/usr/local/go/bin:/opt/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
EOF
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
