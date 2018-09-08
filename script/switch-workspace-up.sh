#!/bin/sh

currentWorkspaceNumber=`wmctrl -d | grep "\*"| awk '{print $1}'`
totalNumberOfWorkspaces=`wmctrl -d | wc | awk '{print $1}'`
targetWorkspace=`expr $currentWorkspaceNumber - $totalNumberOfWorkspaces / 2`
if [ $targetWorkspace -gt $totalNumberOfWorkspaces ] || [ $targetWorkspace -eq $totalNumberOfWorkspaces ]
then
    targetWorkspace=$currentWorkspaceNumber
fi
wmctrl -s $targetWorkspace
