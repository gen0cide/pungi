ubuntu_packages ()
{
  $SUDO="sudo"
  $SUDO apt-get -y update
  $SUDO apt-get -y upgrade
  $SUDO apt-get -y install build-essential    \
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
  echo "[*] Finished installing Ubuntu packages!"
}

ubuntu_rvm ()
{
  curl -L https://get.rvm.io | sudo bash -s stable
  echo "[*] Finished installing RVM!"
  which rvm 
}