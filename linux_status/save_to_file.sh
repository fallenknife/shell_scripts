#!/bin/bash

read -p "Save this information to a file? (Y/N) " choice

if [[ ${choice} =~ ^[Yy]$ ]]; then
  filename="$(date +'%d_%m_%y_%H_%M_%S').status"
  ./print_inf.sh >"${filename}"
fi
