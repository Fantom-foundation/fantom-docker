#/bin/sh
if uname -r | grep -q 'moby'; then 
  if [ -d "/sys/class/net/eth0" ]; then 
    NETWORK_IF=eth0 
  fi
fi
if test -z ${NETWORK_IF}; then 
  for i in $(ls /sys/class/net); do 
    if [ ${i:0:3} = eth ]; then 
      NETWORK_IF=${i} 
    fi 
  done
fi
# If the NETWORK_IF still not set, then search for docker0
if test -z ${NETWORK_IF}; then 
  if [ -d "/sys/class/net/docker0" ]; then 
    NETWORK_IF="docker0" 
  fi
fi
#echo "${NETWORK_IF}"
ip a show "${NETWORK_IF}" | grep 'inet ' | cut -d/ -f1 | awk '{print $2}'
