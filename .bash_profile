# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        export OZONE_PLATFORM=wayland
        export ELECTRON_OZONE_PLATFORM_HINT=wayland

        #put the link here for your own Calendar, im not sharing mine :D

        exec dbus-run-session cage -- chromium --kiosk --no-first-run --simulate-outdated-no-buttons "https://calendar.google.com/calendar/embed?"
fi
