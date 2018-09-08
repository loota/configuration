#!/bin/bash
if [ -f ~/activeWinId ]; then
	origWinId=`cat ~/activeWinId`
	wmctrl -i -a $origWinId
fi
