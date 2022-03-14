#!/usr/bin/env bash
# Kill processes

set -Eeuo pipefail

# First parameter is the file with
# one pid per line.
if [ -f "$1" ]; then
  while read pid
    do
      # handle the case of blank lines
      [[ -n "$pid" ]] || continue

      echo killing $pid
      kill $pid > /dev/null 2> /dev/null || :
    done < $1
fi


