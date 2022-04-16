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
                          bison              \
                          net-tools
  ubuntu_log_info "Finished installing Ubuntu packages!"
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
  curl -sL https://raw.github.com/gen0cide-/pungi/master/linux/ubuntu_base_ps1_profile.sh | sudo tee /etc/profile.d/Z1_PS1.sh > /dev/null
  sudo chmod +x /etc/profile.d/Z1_PS1.sh
  echo "" >> ~/.bashrc
  echo "source /etc/profile.d/Z1_PS1.sh" >> ~/.bashrc
  echo "" | sudo tee /etc/skel/.bashrc > /dev/null
  echo "source /etc/profile.d/Z1_PS1.sh" | sudo tee /etc/skel/.bashrc > /dev/null
  source /etc/profile.d/Z1_PS1.sh
  ubuntu_log_info "Finished setting up global PS1 variable!"
}
# -----------------------------------------------------------------------------
ubuntu_grc ()
{
  apt -y install grc
  echo "GRC_ALIASES=true" >> /etc/default/grc
  echo "GRC_ALIASES=true" >> ~/.bashrc
  echo '[[ -s "/etc/profile.d/grc.sh" ]] && source /etc/grc.sh' >> ~/.bashrc  
  curl -o /etc/grc.sh https://raw.githubusercontent.com/garabik/grc/master/grc.sh
  echo 'GRC_ALIASES=true' >> /etc/profile.d/grc.sh
  chmod 755 /etc/profile.d/grc.sh  
}
# -----------------------------------------------------------------------------
ubuntu_packages
ubuntu_nano
ubuntu_ps1
ubuntu_grc
# -----------------------------------------------------------------------------
ubuntu_log_info "IMPORTANT! You must source /etc/profile for this to function successfully!"
# -----------------------------------------------------------------------------
source /etc/profile
touch /root/.hushlogin
# -----------------------------------------------------------------------------
