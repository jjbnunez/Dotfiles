#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#xrandr --dpi 96
xrdb -merge ~/.config/X11/.Xresources
urxvtd -o -q -f
udiskie &

setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape'&
# setxkbmap -option caps:escape

xinput --set-prop "DLLC6AE:00 06CB:75BF Touchpad" "libinput Tapping Enabled" 1 
xinput --set-prop "DLLC6AE:00 06CB:75BF Touchpad" "libinput Natural Scrolling Enabled" 1
xinput --set-prop "DLLC6AE:00 06CB:75BF Touchpad" "libinput Click Method Enabled" "0, 1"

exec i3
#exec startlxqt
