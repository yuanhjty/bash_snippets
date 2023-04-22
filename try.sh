#! /usr/bin/env bash

# Try the <command> until successful, with a maximum of <n> trys,
# return 0 if successful, else 1.
# usage:
#   try <n> <command>

function try() {
  local maxTry=$1
  local command=$2
  
  local currentTry=0
  local success="false"

  while [ $currentTry -lt $maxTry ] && [ $success = "false" ]
  do
    [ $currentTry -eq 0 ] && echo $command || echo "retry $(( $currentTry )): $command" 
    $command && success="true" || success="false"
    [ $success = "true" ] && echo "successful" || echo "failed"
    currentTry=$(( $currentTry + 1 ))
    echo
  done

  [ $success = "true" ] && return 0 || return 1
}

try $1 $2
