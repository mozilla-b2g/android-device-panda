#!/system/bin/sh
#set up eth0 networking
echo insut >> /data/local/netcf.log
let lim=9
ifconfig eth0
if [[ $? != 0 ]] ; then
  while [[ $lim -gt 0 ]] ; do
    echo $lim >> /data/local/netcf.log
    ( netcfg eth0 dhcp ) & sleep 10
    if [[ $? == 0 ]] ; then
      echo ran >> /data/local/netcf.log
      break
    fi
    kill $!
    let lim=lim-1
  done
fi
psoutput=`ps sut`
echo $psoutput >> /data/local/netcf.log
if [[ $psoutput != *"sutagent"* ]] ; then
  echo startingsut >> /data/local/netcf.log
  export NSPR_LOG_MODULES="NegatusLOG:5, timestamp" && LD_LIBRARY_PATH="/data/local:/data/local/agent:/system/b2g:$LD_LIBRARY_PATH"
  sutagent &
  echo started >> /data/local/netcf.log
fi
