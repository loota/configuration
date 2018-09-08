#!/bin/sh
$(kde4-config --path libexec)kdesu -c "sh -c 'ifdown eth1; sleep 5; ifup eth1'"
