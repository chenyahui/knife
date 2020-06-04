#!/bin/bash

process=""
command="&"

function start() {
  eval "${command}"
  pid=$!
  echo "start $pid"
  echo $pid >/tmp/${process}.pid
}

function stop() {
  pid=$(cat /tmp/${process}.pid)
  echo "stop $pid"
  kill -9 $pid
}

function restart() {
  stop
  start
}

eval $1
