# -----------------------------------------------------------------------------
PUNGI_RUBY_VERSION="2.2.2"
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
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L https://get.rvm.io | bash
ubuntu_log_info "Installed RVM"
# -----------------------------------------------------------------------------
curl -sL https://raw.github.com/gen0cide-/pungi/master/nanorc > ~/.nanorc
curl -sL https://raw.github.com/gen0cide-/pungi/master/linux/ubuntu_ps1_profile.sh >> ~/.profile
ubuntu_log_info "Setup Environment"
# -----------------------------------------------------------------------------
source ~/.profile
# -----------------------------------------------------------------------------
rvm autolibs enable
ubuntu_log_info "Enabled RVM autolibs"
rvm install $PUNGI_RUBY_VERSION
ubuntu_log_info "Installed Ruby"
rvm use $PUNGI_RUBY_VERSION@$UNGI_RUBY_VERSION --default --create
ubuntu_log_info "Setup RVM Correctly"
# -----------------------------------------------------------------------------
