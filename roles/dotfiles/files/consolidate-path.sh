#!/bin/bash
#
# Description: Remove duplicate entries from PATH.
#
# Source: https://github.com/mislav/dotfiles/blob/master/bin/consolidate-path
#
# Usage: PATH="$(consolidate-path "$PATH")"
#

result=":"

IFS=:
for p in $1; do
	  [[ "$result" == *:"$p":* ]] || result="${result}${p}:"
  done

  result="${result#:}"
  echo "${result%:}"
