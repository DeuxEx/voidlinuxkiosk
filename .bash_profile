# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        export OZONE_PLATFORM=wayland
        export ELECTRON_OZONE_PLATFORM_HINT=wayland

        # starta cage utan att rotera skärmen
        #exec dbus-run-session cage -- chromium --kiosk --no-first-run --simulate-outdated-no-buttons "https://calendar.google.com/calendar/embed?src=xxxxxx%40group.calendar.google.com&ctz=Europe%2FStockholm"

        # Starta Cage med ett skript som först roterar och sedan startar Chromium
        exec dbus-run-session cage -- sh -c "wlr-randr --output eDP-1 --transform 90 && chromium --kiosk --no-first-run --simulate-outdated-no-buttons --autoreload-interval=600 "https://calendar.google.com/calendar/embed?src=xxxxxx%40group.calendar.google.com&ctz=Europe%2FStockholm" 
fi
