#!/bin/bash

RUNNING=""

while read -r line; do

  if echo "$line" | grep -q '\[starting\]$'; then
    name="$(echo "$line" | cut -d ' ' -f 1)"
    RUNNING="$(echo "$RUNNING"; echo $name;)"
  elif echo "$line" | grep -q '\[done\]$'; then
    name="$(echo "$line" | cut -d ' ' -f 1)"
    RUNNING="$(echo "$RUNNING" | grep -v -F $name)"
  else
    echo "Invalid line: $line" >&2
  fi

  clear
  echo "RUNNING:"
  echo "$RUNNING" | tr '\n' ' '

done
