#!/bin/bash
activeWinId=`xprop -root | grep _NET_ACTIVE_WINDOW\(WINDOW\) | grep -o "[^ ]*$"`
echo $activeWinId > ~/activeWinId
for id in `wmctrl -l | cut -d " " -f 1`; do
	xprop -id $id | grep "_NET_WM_STATE_DEMANDS_ATTENTION" 2>&1 > /dev/null
	if [ "$?" = "0" ]; then
		wmctrl -i -a $id
		exit 0
	fi
done
exit 1
