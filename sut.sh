#!/system/bin/sh
#set up eth0 networking
psoutput=`ps sut`
if [[ $psoutput != *"sutagent"* ]] ; then
  export NSPR_LOG_MODULES="NegatusLOG:5, timestamp" && LD_LIBRARY_PATH="/data/local:/data/local/agent:/system/b2g:$LD_LIBRARY_PATH"
  sutagent &>> /data/local/sut.log
fi
