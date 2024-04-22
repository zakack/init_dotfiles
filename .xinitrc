# Loads Xresources dotfile on boot, mainly for URxvt transparency etc.
xrdb -load ~/.Xresources &

# -R restores the last colorscheme that was in use.
pywal -R

setxkbmap -layout 'us' -option '' -option 'caps:escape'

# Initiates i3wm
exec i3

setxkbmap -layout 'us' -option '' -option 'caps:escape'
