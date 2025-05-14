#!/bin/bash

HOSTNAME=$(hostname)

TIMEZONE=$(
  ZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
  OFFSET=$(date +%:z)
  OFFSET_HOURS=$(echo "$OFFSET" | awk -F: '{printf "%d", $1}')
  echo "$ZONE UTC $OFFSET_HOURS"
)

USER=$(whoami)

OS=$(awk -F '=' '/^PRETTY_NAME/ {gsub(/"/, "", $2); print $2}' /etc/os-release)

DATE=$(date +"%d %B %Y %T")

UPTIME=$(uptime -p | awk -F'up ' '{print $2}')

UPTIME_SEC=$(awk '{print int($1)}' /proc/uptime)

IP=$(ip -o addr show | grep 'eth0' | awk '!/127.0.0.1/ {print $4}' | cut -d/ -f1 | head -n1)

MASK=$(ip -o -f inet addr show | grep 'eth0' | awk '{split($4,a,"/"); mask=a[2];
  for(i=0;i<4;i++){s=(mask>=8)?255:(mask>0)?(256-2^(8-mask)):0;
  printf s; mask-=8; if(i<3)printf "."}; print ""}')

GATEWAY=$(ip route | grep default | awk -F 'via ' '{print $2}' | cut -d ' ' -f1)

RAM_TOTAL=$(awk '/MemTotal/ {printf "%.3f GB\n", $2 / 1024 / 1024}' /proc/meminfo)

RAM_USED=$(
  awk '/MemTotal/ {total=$2} /MemAvailable/ {avail=$2} END {used=total-avail; printf "%.3f GB\n", used / 1024 / 1024}' /proc/meminfo
)

RAM_FREE=$(awk '/MemFree/ {printf "%.3f GB\n", $2 / 1024 / 1024}' /proc/meminfo)

SPACE_ROOT=$(
  df -k / | awk 'NR==2 {printf "%.2f MB\n", $2 / 1024}'
)

SPACE_ROOT_USED=$(
  df -k / | awk 'NR==2 {printf "%.2f MB\n", $3 / 1024}'
)

SPACE_ROOT_FREE=$(df -k / | awk 'NR==2 {printf "%.2f MB\n", $4 / 1024}')
