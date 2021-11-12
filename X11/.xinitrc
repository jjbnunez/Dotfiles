xrdb -merge ~/.config/X11/.Xresources
urxvtd -o -q -f tabbedex
udiskie &

setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape'&
# setxkbmap -option caps:escape

exec i3
