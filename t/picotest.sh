#!/usr/bin/env bash

# pico testing library for bash
# usage:
# 1. source this file in your test suite
# 2. write some tests like so:
#
# testFoo() {
#   PP "testing foo"
#   Check "assertEquals" "foo" "foo"
# }
#
# Run ; Report ; Finish
#
# 3. That's it!

Failed=0
Passed=0
TestCount=0

Pass() {
  Passed=$(( $Passed +1))
}

Fail() {
  Failed=$(( $Failed+1))
}

Finish() {
  exit $Failed
}

## Helpers

# Tiny wrapper for echo, keeps message style consistent
PP() {
  echo ">> $*"
}

# run all tests
# greps this file for functions prefixed with test and then
# executes them
Run() {
  local loc=$(dirname $0)/$(basename $0)
  local tests=$(grep "^test.*\(\)" $loc  | cut -d"(" -f1)
  for t in $tests ; do
    PP $t
    $t || printf "\n"
    TestCount=$(( $TestCount +1))
  done
}

# report how many failed and passed
Report() {
  echo $TestCount tests, Failed: $Failed Passed: $Passed
}

assertEquals() {
  local s=0
  if [[ "$1" != "$2" ]] ; then
    PP "!! $1 not equal to $2" 1>&2
    s=1
  fi
  echo $s
}

# sort-of rspec like reporter, use like so:
#
#    description="testing testing"
#    Check "assertEquals" $s1 $s2
#
# If s1 and s2 are same it will update passed count, otherwise failed will
# be updated.
Check() {
  local r=$($1 "$2" "$3" "$4" "$5")
  local status=""
  [[ $r == 0 ]] && status="Passed" && Pass
  [[ $r != 0 ]] && status="Failed" && Fail
  PP "  $status"
  echo
}


