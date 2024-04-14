Make sure we use xorg at login screen (cogwheel bottom right)
Add this command to startup aplications:
xrandr --newmode "5120x1440_60.00"  624.50  5120 5496 6048 6976  1440 1443 1453 1493 -hsync +vsync; xrandr | grep ' connected' | cut -d ' ' -f1 | xargs -I{} xrandr --addmode {} 5120x1440_60.00; xrandr | grep ' connected' | cut -d ' ' -f1 | xargs -I{} xrandr --output {} --mode 5120x1440_60.00
