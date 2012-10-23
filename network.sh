#!/system/bin/sh
#set up eth0 networking
let lim=9
ifconfig eth0
if [[ $? != 0 ]] ; then
  while [[ $lim -gt 0 ]] ; do
    ( netcfg eth0 dhcp ) & sleep 10
    if [[ $? == 0 ]] ; then
      break
    fi
    kill $!
    let lim=lim-1
  done
fi
if [[ $lim == 0 ]]; then
  echo unable to setup networking >> /data/local/netcf.log
fi
