# -----------------------------------------------------------------------------
if [ "$(id -u)" != "0" ]; then
   echo "[!] This script must be run as root." 1>&2
   exit 1
fi
# -----------------------------------------------------------------------------
sysctl vm.overcommit_memory=1
# -----------------------------------------------------------------------------
apt-get install -y python-software-properties libmagic-dev tree
echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
add-apt-repository -y ppa:chris-lea/redis-server
add-apt-repository -y ppa:nginx/stable
apt-get update
apt-get install -y postgresql-9.3 postgresql-contrib-9.3 uuid redis-server nginx
# -----------------------------------------------------------------------------