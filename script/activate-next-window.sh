#!/bin/zsh
activateNextWindow=0
activeWindow=$(xprop -root -f _NET_ACTIVE_WINDOW 0x " \$0\\n" _NET_ACTIVE_WINDOW | awk "{print \$2}")
activeWindowHexWithout0x=`echo $activeWindow | sed -e 's/^0x//' | tr "[:lower:]" "[:upper:]"`
activeWindowIdInteger=`echo "ibase=16; $activeWindowHexWithout0x"|bc`
for i in $(wmctrl -l | grep "^[^ ]* *[^ ]* "`xprop -root | grep "^_NET_CURRENT_DESKTOP(CARDINAL)" | grep "[^ ]*$" -o`| awk '{print $1}')
do
    windowHexWithout0x=`echo $i | sed -e 's/^0x//' | tr "[:lower:]" "[:upper:]"`
    windowIdInteger=`echo "ibase=16; $windowHexWithout0x"|bc`
    if [ $activateNextWindow -ne 0 ]
    then
        # activate next window
        xdotool windowactivate $i
        exit
    fi
    if [ $activeWindowIdInteger -eq $windowIdInteger ]
    then
      activateNextWindow=1
    fi
done

firstWindow=$(wmctrl -l | grep "^[^ ]* *[^ ]* "`xprop -root | grep "^_NET_CURRENT_DESKTOP(CARDINAL)" | grep "[^ ]*$" -o`| awk '{print $1}' | head -n 1)
# activate first window in wmctrl list
xdotool windowactivate $firstWindow
