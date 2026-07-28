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
# install a good servicehandler (vsv) and texteditor (nano)
xbps-install vsv nano 

# install some runit services which we need
xbps-install seatd elogind dbus 

# install a needable font
xbps-install ttf-opensans

# install videodrivers and vulkans for wayland setup
xbps-install mesa-dri mesa-vaapi mesa-vulkan-intel intel-video-accel vulkan-loader

# install avahi and modules to get mdns working
xbps-install avahi avahi-autoipd avahi-compat-libs avahi-discover avahi-glib-libs avahi-ui-libs avahi-ui-libs-gtk3 avahi-ui-utils avahi-utils nss-mdns

# we want to have the screen off at night and start at the morning
xbps-install wlopm cronie

# Make a system update
xbps-install -Suv


# cleanup the system
xbps-remove --clean-cache --remove-orphans
xbps-reconfigure -fa

export LIBSEAT_BACKEND=builtin

# create the needable files for auto-login and night/day-mode
nano ~/.bash_profile 
nano /etc/sv/agetty-tty1/run 
nano ~/sleep.sh
nano ~/wake.sh 
nano /etc/nsswitch.conf 
nano /etc/avahi/avahi-daemon.conf 

# link the services so they autostart from now on
ln -s /etc/sv/dbus/ /etc/runit/runsvdir/default/
ln -s /etc/sv/elogind/ /etc/runit/runsvdir/default/
ln -s /etc/sv/seatd/ /etc/runit/runsvdir/default/
ln -s /etc/sv/chronyd /etc/runit/runsvdir/default/
ln -s /etc/sv/cronie/ /etc/runit/runsvdir/default/
ln -s /etc/sv/avahi-daemon/ /etc/runit/runsvdir/default/

# put the user in the correct group
usermod -aG video,input void

# make the files executable
chmod +x ~/wake.sh 
chmod +x ~/sleep.sh 


crontab -e

