let
  kittyConfigPath = ../../dotfiles/kitty/kitty.conf;
  conkyLauncher = ../../dotfiles/conky/launch.sh;
  polybarLauncher = ../../dotfiles/polybar/launch.sh;
in
''
# This file has been auto-generated by i3-config-wizard(1).
# It will not be overwritten, so edit it as you like.
#
# Should you change your keyboard layout some time, delete
# this file and re-run i3-config-wizard(1).
#
# i3 config file (v4)
#
# Please see https://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4

# Disable window titles
for_window [class="^.*"] border pixel 1
new_window 1pixel

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:Roboto Mono For Powerline 12

# Before i3 v4.8, we used to recommend this one as the default:
# font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
# The font above is very space-efficient, that is, it looks good, sharp and
# clear in small sizes. However, its unicode glyph coverage is limited, the old
# X core fonts rendering does not support right-to-left and this being a bitmap
# font, it doesn’t scale on retina/hidpi displays.

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec kitty --config=${builtins.toString kittyConfigPath}

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec dmenu_run
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
# bindsym $mod+d exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+ccedilla focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+ccedilla move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# set workspace variable
set $workspace1 "1: "
set $workspace2 "2: "
set $workspace3 "3: "
set $workspace4 "4: "
set $workspace5 "5: "
set $workspace6 "6: "
set $workspace7 "7: "
set $workspace8 "8: "
set $workspace9 "9: "
set $workspace10 "10: "

# switch to workspace
bindsym $mod+1 workspace $workspace1
bindsym $mod+2 workspace $workspace2
bindsym $mod+3 workspace $workspace3
bindsym $mod+4 workspace $workspace4
bindsym $mod+5 workspace $workspace5
bindsym $mod+6 workspace $workspace6
bindsym $mod+7 workspace $workspace7
bindsym $mod+8 workspace $workspace8
bindsym $mod+9 workspace $workspace9
bindsym $mod+0 workspace $workspace10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $workspace1
bindsym $mod+Shift+2 move container to workspace $workspace2
bindsym $mod+Shift+3 move container to workspace $workspace3
bindsym $mod+Shift+4 move container to workspace $workspace4
bindsym $mod+Shift+5 move container to workspace $workspace5
bindsym $mod+Shift+6 move container to workspace $workspace6
bindsym $mod+Shift+7 move container to workspace $workspace7
bindsym $mod+Shift+8 move container to workspace $workspace8
bindsym $mod+Shift+9 move container to workspace $workspace9
bindsym $mod+Shift+0 move container to workspace $workspace10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width       2 px or 2 ppt
        bindsym k resize grow height        2 px or 2 ppt
        bindsym l resize shrink height      2 px or 2 ppt
        bindsym ccedilla resize grow width  2 px or 2 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width   2 px or 2 ppt
        bindsym Down resize grow height    2 px or 2 ppt
        bindsym Up resize shrink height    2 px or 2 ppt
        bindsym Right resize grow width    2 px or 2 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

# Media player controls
bindsym XF86AudioPlay exec playerctl play
bindsym XF86AudioPause exec playerctl pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl -- set-sink-volume 0 +5% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl -- set-sink-volume 0 -5% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle # mute sound

# Extra shortcuts
# Mod1 => Alt
# Mod2 => Numlock
# Mod4 => Windows
# Mod5 => Alt_GR

# Mod + Key

# Mod4 + Shift + Key
bindsym $mod+Shift+f exec firefox
bindsym $mod+Shift+p exec firefox -private-window
bindsym $mod+Shift+o exec kitty -e ranger

# Mod4 + Key
bindsym --release $mod+Print exec scrot -s

# Utils - Mod1 + Key
bindsym Mod1+g exec gimp
bindsym Mod1+l exec i3lock-fancy

# -------------------------
#      i3-gaps config
# -------------------------
# smart_gaps on
gaps inner 10
gaps outer 8

# -------------------------
#      pywal-config
# ------------------------
set_from_resource $fg i3wm.color7 #f0f0f0
set_from_resource $bg i3wm.color2 #f0f0f0

set_from_resource $color1 i3wm.color1 #f0f0f0
set_from_resource $color2 i3wm.color2 #f0f0f0
set_from_resource $color3 i3wm.color3 #f0f0f0
set_from_resource $color4 i3wm.color4 #f0f0f0
set_from_resource $color5 i3wm.color5 #f0f0f0
set_from_resource $color6 i3wm.color6 #f0f0f0
set_from_resource $color7 i3wm.color7 #f0f0f0

# class                 border   backgr.  text     indicator child_border
client.focused          $color2  $color1  $fg      $color7   $color5
client.focused_inactive $color3  $bg      $fg      $color7   $color5
client.unfocused        $bg      $bg      $fg      $bg       $bg
client.urgent           $bg      $bg      $color3  $bg       $bg
client.placeholder      $bg      $bg      $fg      $bg       $bg

client.background       $bg

# # PROTIP: You can also dynamically set dmenu's colors this way:
# bindsym $mod+d exec dmenu_run -nb "$fg" -nf "$bg" -sb "$bg" -sf "$fg"
# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)

exec_always wal -i "$(< "$\{HOME}/.cache/wal/wal")"

exec_always --no-startup-id ${builtins.toString conkyLauncher}
exec_always --no-startup-id ${builtins.toString polybarLauncher}
''
