#/sbin/route del default gw 10.0.2.2
#/sbin/route add default gw 172.16.80.1

#if we change the default route, then we can't update packages because we aren't NAT'd
/sbin/route add -net 192.168.2.0 netmask 255.255.255.0 gw 172.16.80.1

#for now everything from home is nat'd so make sure we can route back to the tunnel ip
/sbin/route add -host 10.0.0.200 gw 172.16.80.1
