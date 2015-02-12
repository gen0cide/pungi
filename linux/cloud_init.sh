# ------------------------------------------------------------------------------------------------------------
PUNGI_RUBY_VERSION="2.2.0"
PUNGI_DEFAULT_GEMSET="base"
# ------------------------------------------------------------------------------------------------------------
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L https://get.rvm.io | sudo bash -s stable
source /etc/profile.d/rvm.sh
sudo usermod -a -G rvm $(whoami)
rvm autolibs enable
# rvm install $PUNGI_RUBY_VERSION --movable -- --with-jemalloc
# rvm use $PUNGI_RUBY_VERSION@$PUNGI_DEFAULT_GEMSET --default --create
# ------------------------------------------------------------------------------------------------------------
curl -sL https://raw.github.com/gen0cide-/pungi/master/linux/ubuntu_ps1_profile.sh | sudo tee /etc/profile.d/Z1_PS1.sh > /dev/null
chmod +x /etc/profile.d/Z1_PS1.sh
echo "" >> ~/.bashrc
echo "source /etc/profile.d/Z1_PS1.sh" >> ~/.bashrc
echo "" >> /etc/skel/.bashrc
echo "source /etc/profile.d/Z1_PS1.sh" >> /etc/skel/.bashrc
# ------------------------------------------------------------------------------------------------------------
curl -sL https://raw.github.com/gen0cide-/pungi/master/nanorc | sudo tee /etc/nanorc > /dev/null
# ------------------------------------------------------------------------------------------------------------
echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 9.4" > /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# ------------------------------------------------------------------------------------------------------------
add-apt-repository -y ppa:chris-lea/redis-server
add-apt-repository -y ppa:nginx/stable
add-apt-repository -y ppa:chris-lea/node.js
# ------------------------------------------------------------------------------------------------------------
apt-get update
# ------------------------------------------------------------------------------------------------------------
apt-get -y install nodejs postgresql-9.4 postgresql-contrib-9.4 postgresql-client-9.4 nginx uuid redis-server
# ------------------------------------------------------------------------------------------------------------
service postgresql stop
service nginx stop
service redis-server stop
# ------------------------------------------------------------------------------------------------------------
/usr/sbin/update-rc.d postgresql disable
/usr/sbin/update-rc.d nginx disable
/usr/sbin/update-rc.d redis-server disable
# ------------------------------------------------------------------------------------------------------------
