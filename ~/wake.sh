#!/bin/sh
export WAYLAND_DISPLAY=$(ls /run/user/$(id -u)/wayland-* 2>/dev/null | head -n 1 | xargs basename)
export XDG_RUNTIME_DIR=/run/user/$(id -u)
wlopm --on \*
