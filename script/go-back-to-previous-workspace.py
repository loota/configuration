#!/usr/bin/python

import dbus
from dbus.mainloop.glib import DBusGMainLoop
import pygtk
pygtk.require('2.0')
import gtk
import traceback
import re

# This is a very dirty hack which will probably affect the karma and maybe
# even cause a global meltdown...
regex = re.compile('The global shortcut for Switch to Desktop (.*) was issued.')

lastdesktop=None
prevdesktop=None

def match(bus, msg):
    print 'jepa'
    global lastdesktop, prevdesktop, newdesktop, curdesktop, kwin
    print msg
    print msg.get_path()
    if msg.get_path() == '/Notify':
        args = msg.get_args_list()
        if args[0] == "globalshortcutpressed":
            val = regex.findall(args[4])
            if lastdesktop == None or prevdesktop == None:
                return
            if val:
                curdesktop = "%s" % (val[0])
                if lastdesktop == curdesktop:
                    global kwin
                    kwin.setCurrentDesktop(int(prevdesktop))
        elif len(args[0]) > 6:
            param = args[0][:7]
            if param == 'desktop':
                val = args[0][7:]
                newdesktop = "%s" % val
                if newdesktop == lastdesktop:
                    return
                else:
                    prevdesktop = "%s" % lastdesktop
                    lastdesktop = "%s" % val

if __name__ == "__main__":
    DBusGMainLoop(set_as_default=True)

    bus = dbus.SessionBus()
    bus2 = dbus.SessionBus()

    # ask dbus-daemon to receive all matching messages
    bus.add_match_string("member='event',interface='org.kde.KNotify'")

    # add a callback when receiving a message
    bus.add_message_filter(match)

    kwin = bus2.get_object('org.kde.kwin', '/KWin')

    try:
        gtk.main()
    except:
        traceback.print_exc()
