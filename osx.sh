read -r -d '' PUNGI_BREW_TAPS<<'EOF'
caskroom/cask
caskroom/fonts
homebrew/boneyard
homebrew/completions
homebrew/core
homebrew/dupes
homebrew/php
homebrew/python
homebrew/science
homebrew/services
EOF

read -r -d '' PUNGI_BREW_BREWS<<'EOF'
brew install pcre
brew link pcre
brew install coreutils
brew install binutils
brew install diffutils
brew install ed --with-default-names
brew install findutils --with-default-names
brew install gawk
brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install gnutls
brew install grep --with-default-names
brew install gzip
brew install screen
brew install watch
brew install wdiff --with-gettext
brew install wget
brew install bash
brew install emacs
brew install gpatch
brew install less
brew install m4
brew install make
brew install nano
brew install file-formula
brew install git
brew install openssh
brew install rsync
brew install svn
brew install unzip
brew install vim --override-system-vi
brew install macvim --override-system-vim --custom-system-icons
brew install zsh
brew install ack
brew install arp-scan
brew install arping
brew install autoconf
brew install automake
brew install autossh
brew install awscli
brew install bash-completion
brew install bdw-gc
brew install binwalk
brew install bison
brew install bundler-completion
brew install bzip2
brew install cairo
brew install cifer
brew install cmake
brew install colordiff
brew install cowsay
brew install crunch
brew install dex2jar
brew install dns2tcp
brew install dnsmasq
brew install dos2unix
brew install eigen
brew install exiftool
brew install fcrackzip
brew install flac
brew install fontconfig
brew install fortune
brew install freetype
brew install gem-completion
brew install geoip
brew install gettext
brew install git-crypt
brew install git-extras
brew install git-flow
brew install git-lfs
brew install glib
brew install gmp
brew install gnupg2
brew install gnutls
brew install gobject-introspection
brew install gpg-agent
brew install grok
brew install hashpump
brew install hh
brew install htop
brew install hydra
brew install icu4c
brew install iftop
brew install ilmbase
brew install imagemagick
brew install isl
brew install jam
brew install jasper
brew install jemalloc
brew install john
brew install jpeg
brew install jq
brew install json-c
brew install knock
brew install libassuan
brew install libdnet
brew install libevent
brew install libffi
brew install libgcrypt
brew install libgpg-error
brew install libiconv
brew install libksba
brew install libmagic
brew install libmpc
brew install libnet
brew install libpcap
brew install libplist
brew install libpng
brew install libtasn1
brew install libtiff
brew install libtool
brew install libusb
brew install libusb-compat
brew install libxml2
brew install libxslt
brew install libyaml
brew install links
brew install llvm
brew install lsof
brew install lua
brew install luajit
brew install lynx
brew install markdown
brew install masscan
brew install md5sha1sum
brew install mpfr
brew install nacl
brew install nano
brew install ncdu
brew install ncurses
brew install netpbm
brew install nettle
brew install nikto
brew install nmap
brew install ntopng
brew install numpy
brew install nyancat
brew install oniguruma
brew install openexr
brew install openssl
brew install osxutils
brew install p7zip
brew install pango
brew install pcre
brew install php70
brew install pigz
brew install pinentry
brew install pixman
brew install pkg-config
brew install pngcheck
brew install progress
brew install psgrep
brew install pssh
brew install pth
brew install pv
brew install pyside
brew install readline
brew install rename
brew install rhino
brew install rrdtool
brew install rsync
brew install shc
brew install shellcheck
brew install shiboken
brew install siege
brew install sl
brew install sloccount
brew install socat
brew install speedtest_cli
brew install sphinx-doc
brew install sqlite
brew install sqlmap
brew install srm
brew install ssdeep
brew install ssh-copy-id
brew install swig
brew install tcpdump
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install tidy-html5
brew install tig
brew install tmux
brew install tokyo-cabinet
brew install tor
brew install tree
brew install ucl
brew install unixodbc
brew install unrar
brew install unzip
brew install upx
brew install watch
brew install webp
brew install wget
brew install whois
brew install xz
brew install yara
brew install arcanist
EOF

read -r -d '' PUNGI_BREW_CASKS<<'EOF'
java
vlc
jd-gui
torbrowser
bit-slicer
google-chrome
little-snitch
keka
shimo
iterm2
1password
amazon-workspaces
wireshark
veracrypt
spotify
burp-suite
caffeine
gpgtools
hex-fiend
santa
font-source-code-pro
zoomus
sequel-pro
EOF

read -r -d '' PUNGI_BASH_PROFILE<<'EOF'
# ------------------------------------------------------------------------------
# Define the local path
# ------------------------------------------------------------------------------
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export PATH="$HOME/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH"
# ------------------------------------------------------------------------------
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi
# ------------------------------------------------------------------------------
export JAVA_HOME="$(find /Library/Java/JavaVirtualMachines/ -name 'Home' | head -n 1)"
export rvmsudo_secure_path=1
export EDITOR='nano'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export HISTTIMEFORMAT="%d/%m/%y %T "
export COMP_KNOWN_HOSTS_WITH_HOSTFILE=""
export HOMEBREW_GITHUB_API_TOKEN="__GITHUB_TOKEN__"
export FABRIC_OUTPUT_CONFIG=kitchen-sink
# ------------------------------------------------------------------------------
shopt -s histappend
# ------------------------------------------------------------------------------
source $HOME/.aliases
source $HOME/.profile
# ------------------------------------------------------------------------------
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# ------------------------------------------------------------------------------
NO_COLOUR="\[\033[0m\]"
RED="\[\033[00;31m\]"
GREEN="\[\033[00;32m\]"
YELLOW="\[\033[00;33m\]"
BLUE="\[\033[00;34m\]"
MAGENTA="\[\033[00;35m\]"
PURPLE="\[\033[00;35m\]"
CYAN="\[\033[00;36m\]"
LIGHTGRAY="\[\033[00;37m\]"
LRED="\[\033[01;31m\]"
LGREEN="\[\033[01;32m\]"
LYELLOW="\[\033[01;33m\]"
LBLUE="\[\033[01;34m\]"
LMAGENTA="\[\033[01;35m\]"
LPURPLE="\[\033[01;35m\]"
LCYAN="\[\033[01;36m\]"
WHITE="\[\033[01;37m\]"
# ------------------------------------------------------------------------------
export LANG=en_US.UTF-8
# ------------------------------------------------------------------------------
complete -C aws_completer aws
# ------------------------------------------------------------------------------
PS1="$LRED\t $LYELLOW\h$NO_COLOUR/$GREEN\u $WHITE@\W$NO_COLOUR $YELLOW\$(parse_git_branch)$NO_COLOUR \\$ "
# ------------------------------------------------------------------------------
GOPATH="$HOME/go"
# ------------------------------------------------------------------------------
export PATH="$GOPATH/bin:$PATH"
# ------------------------------------------------------------------------------
EOF

function pungi_info() {
  echo "[!] ($(date)) $1"
}

function pungi_error() {
  echo "[!] ($(date)) ERROR: $1"
}

function pungi_setup_ssh() {
  mkdir -p ~/.ssh
  chmod -R 700 ~/.ssh
  ssh-keygen -t rsa -b 4096 -C '' -N '' -f ~/.ssh/id_rsa
  sudo systemsetup -f -setremotelogin on
}

function pungi_setup_hostname() {
  local PUNGI_HOSTNAME="$1"
  sudo scutil --set ComputerName "${PUNGI_HOSTNAME}"
  sudo scutil --set LocalHostName "${PUNGI_HOSTNAME}"
  sudo scutil --set HostName "${PUNGI_HOSTNAME}"
}

function pungi_fix_quotations() {
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
}

function pungi_disable_chrome_touches() {
  defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
  defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false
}

function pungi_fix_save_and_print_dialogs() {
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToButt -bool false
}

function pungi_disable_hotplug_cameras() {
  defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
}

function pungi_fix_bluetooth_quality() {
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
}

function pungi_fix_finder() {
  defaults write com.apple.BezelServices kDimTime -int 300
  defaults write com.apple.Finder AppleShowAllFiles -bool true
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  chflags nohidden ~/Library/
}

function pungi_fix_terminal() {
  defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false
  defaults write com.apple.terminal StringEncodings -array 4
  defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
  defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"
}

function pungi_disable_time_machine() {
  defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
}

function pungi_disable_volumes_indexing() {
  sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
}

function pungi_install_xcode_tools() {
  sudo xcode-select --install
  sudo xcodebuild -license accept
}

function pungi_setup_osx_firewall() {
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
}

function pungi_disable_ir() {
  sudo defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -int 0
}

function pungi_disable_icloud_saving() {
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool FALSE
}

function pungi_cripple_safari() {
  defaults write com.apple.Safari WebKitOmitPDFSupport -bool YES
  defaults write com.apple.Safari WebKitJavaScriptEnabled -bool FALSE 
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptEnabled -bool FALSE
  defaults write com.apple.Safari UniversalSearchEnabled -bool false
  defaults write com.apple.Safari SuppressSearchSuggestions -bool true
}

function pungi_screensaver_security() {
  local UUID
  UUID=$(ioreg -rd1 -c IOPlatformExpertDevice | grep "IOPlatformUUID" | sed -e 's/^.*"\(.*\)"$/\1/')
  for i in $(find /Users -type d -maxdepth 1); do 
    local PREF="$i/Library/Preferences/ByHost/com.apple.screensaver.$UUID"
    if [ -e "$PREF.plist" ]; then 
      defaults -currentHost write "$PREF.plist" idleTime -int 120
    fi
  done
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 1
}

function pungi_require_admin_for_settings() {
  security authorizationdb read system.preferences > /tmp/system.preferences.plist &&
  /usr/libexec/PlistBuddy -c "Set :shared false" /tmp/system.preferences.plist && 
  security authorizationdb write system.preferences < /tmp/system.preferences.plist
}

function pungi_disable_ipv6() {
  networksetup -listallnetworkservices | while read i; do 
    local SUPPORT
    SUPPORT=$(networksetup -getinfo "$i" | grep "IPv6: Automatic") && 
    if [ -n "$SUPPORT" ]; then 
      networksetup -setv6off "$i" 
    fi 
  done
}

function pungi_install_homebrew() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function pungi_brew_disable_analytics() {
  brew analytics off  
}

function pungi_brew_write_lists() {
  echo "${PUNGI_BREW_TAPS}" > /tmp/brew_taps.txt
  echo "${PUNGI_BREW_BREWS}" > /tmp/brew_brews.txt
  echo "${PUNGI_BREW_CASKS}" > /tmp/brew_casks.txt
}

function pungi_brew_install_taps() {
  IFS=$'\n'
  for app in $(</tmp/brew_taps.txt); do
    echo "[*] ($(date)) Tapping Brew: $app"
    brew tap $app.
  done
}

function pungi_brew_install_brews() {
  IFS=$'\n'
  for app in $(</tmp/brew_brews.txt); do  
    echo "[*] ($(date)) Installing Brew: $app"
    eval $app
  done
}

function pungi_brew_install_casks() {
  IFS=$'\n'
  for app in $(</tmp/brew_casks.txt); do
    echo "[*] ($(date)) Installing Cask: $app"
    brew cask install $app
  done
}

function pungi_write_bash_profile() {
  echo "${PUNGI_BASH_PROFILE}" > ~/.bash_profile
  sed -i -e "s/__GITHUB_TOKEN__/${HOMEBREW_GITHUB_API_TOKEN}/g" ~/.bash_profile
}

function pungi_all_the_things() {
  PUNGI_HOSTNAME="$1"
  pungi_info "Setting Up Hostname"
  pungi_setup_hostname "$PUNGI_HOSTNAME"
  pungi_info "Fixing OSX Quotations"
  pungi_fix_quotations
  pungi_info "Fixing OSX Dialogs"
  pungi_fix_save_and_print_dialogs
  pungi_info "Disabling Hot Plug Cameras"
  pungi_disable_hotplug_cameras
  pungi_info "Fixing OSX Bluetooth"
  pungi_fix_bluetooth_quality
  pungi_info "Fixing OSX Finder"
  pungi_fix_finder
  pungi_info "Fixing OSX Terminal"
  pungi_fix_terminal
  pungi_info "Disabling Time Machine"
  pungi_disable_time_machine
  pungi_info "Disabling Volume Indexing"
  pungi_disable_volumes_indexing
  pungi_info "Installing XCode Tools"
  pungi_install_xcode_tools
  pungi_info "Setting Sane OSX Firewall Defaults"
  pungi_setup_osx_firewall
  pungi_info "Disabling IR Controls"
  pungi_disable_ir
  pungi_info "Disabling iCloud Drive"
  pungi_disable_icloud_saving
  pungi_info "Crippling Safari Because Security"
  pungi_cripple_safari
  pungi_info "Setting OSX Screensaver Settings"
  pungi_screensaver_security
  pungi_info "Setting OSX Admin Settings"
  pungi_require_admin_for_settings
  pungi_info "Disabling IPv6"
  pungi_disable_ipv6
  pungi_info "Installing Homebrew"
  pungi_install_homebrew
  pungi_info "Disabling Homebrew Analytics"
  pungi_brew_disable_analytics
  pungi_info "Writing Brew Lists"
  pungi_brew_write_lists
  pungi_info "Installing Homebrew Taps"
  pungi_brew_install_taps
  pungi_info "Brewing all the things"
  pungi_brew_install_brews
  pungi_info "Installing Homebrew Casks"
  pungi_brew_install_casks
  pungi_info "Disabling Chrome Fuckery"
  pungi_disable_chrome_touches
  pungi_info "Writing Bash Profile"
  pungi_write_bash_profile
}
