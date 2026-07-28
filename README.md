<p></p>
# voidlinux kiosk-mode <br>
# this is my way to setup a kiosk running in wayland in void linux <br>
<p></p>
# First install void linux from live iso image <br>
<p></p>
# update the installer first <br>
xbps-install -u xbps-install <br>
<p></p>
# install cage (kiosk compositor) and chromium and wayland to be able to start up a browser in wayland  <br>
xbps-install cage chromium wayland <br>
<p></p>
# install wlr-randr to be able to flip the screen on wayland systems <br>
xbps-install wlr-randr <br>
<p></p>
# install a good servicehandler (vsv) and texteditor (nano) <br>
xbps-install vsv nano  <br>
<p></p>
# install some runit services which we need <br>
xbps-install seatd elogind dbus  <br>
<p></p>
# install a needable font <br>
xbps-install ttf-opensans <br>
<p></p>
# install videodrivers and vulkans for wayland setup <br>
xbps-install mesa-dri mesa-vaapi mesa-vulkan-intel intel-video-accel vulkan-loader <br>
<p></p>
# install avahi and modules to get mdns working <br>
xbps-install avahi avahi-autoipd avahi-compat-libs avahi-discover avahi-glib-libs avahi-ui-libs avahi-ui-libs-gtk3 avahi-ui-utils avahi-utils nss-mdns <br>
<p></p>
# we want to have the screen off at night and start at the morning <br>
xbps-install wlopm cronie <br>
<p></p>
# Make a system update <br>
xbps-install -Suv <br>
<p></p>
<p></p>
# cleanup the system <br>
xbps-remove --clean-cache --remove-orphans <br>
<p></p>
# update the systems boot files <br>
xbps-reconfigure -fa <br>
<p></p>
export LIBSEAT_BACKEND=builtin <br>
export EDITOR=nano <br>
<p></p>
# create the needable files for auto-login and night/day-mode <br>
nano ~/.bash_profile  <br>
nano /etc/sv/agetty-tty1/run <br> 
nano ~/sleep.sh <br>
nano ~/wake.sh  <br>
nano /etc/nsswitch.conf  <br>
nano /etc/avahi/avahi-daemon.conf  <br>
<p></p>
# link the services so they autostart from now on <br>
ln -s /etc/sv/dbus/ /etc/runit/runsvdir/default/ <br>
ln -s /etc/sv/elogind/ /etc/runit/runsvdir/default/ <br>
ln -s /etc/sv/seatd/ /etc/runit/runsvdir/default/ <br>
ln -s /etc/sv/chronyd /etc/runit/runsvdir/default/ <br>
ln -s /etc/sv/cronie/ /etc/runit/runsvdir/default/ <br>
ln -s /etc/sv/avahi-daemon/ /etc/runit/runsvdir/default/ <br>
<p></p>
# put the user in the correct group <br>
usermod -aG video,input void <br>
<p></p>
# make the files executable <br>
chmod +x ~/wake.sh  <br>
chmod +x ~/sleep.sh  <br>


crontab -e

