#!/bin/sh
if [ `grep "ElectricBorders=2" ~/.kde/share/config/kwinrc` ]
then
    sed -i -e 's/ElectricBorders=2/ElectricBorders=0/' ~/.kde/share/config/kwinrc 
    qdbus org.kde.kded /Layouts org.kde.KeyboardLayouts.setLayout fi
    wmctrl -s 1
else
    sed -i -e 's/ElectricBorders=0/ElectricBorders=2/' ~/.kde/share/config/kwinrc 
    qdbus org.kde.kded /Layouts org.kde.KeyboardLayouts.setLayout us
fi
kwin --replace &
