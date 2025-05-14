#!/bin/bash
if [ $# -ne 0 ]; then
  echo "Error: Invalid number of arguments"
  exit 1
fi
chmod +rx print_inf.sh save_to_file.sh
. ./print_inf.sh
. ./save_to_file.sh
exit 0