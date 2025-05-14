#!/bin/bash
if [ $# -ne 1 ]; then
  echo "Error: Invalid number of arguments"
  exit 1
else
  if ! [ -d "$1" ]; then
    echo "Error: No such directory"
    exit 1
  fi
fi

chmod +x print_inf.sh

. ./print_inf.sh

echo -e "Script execution time (in seconds) = $SECONDS"
exit 0
