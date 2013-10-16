#!/usr/bin/env bash

# pico testing library for bash
# usage:
# 1. source this file in your test suite
# 2. write some tests like so:
#
# testFoo() {
#   echo "testing foo"
#   Check "assertEquals" "foo" "foo"
# }
#
# Run ; Report ; exit $Failed
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

# run all tests
# greps this file for functions prefixed with test and then
# executes them
Run() {
  local loc=$(dirname $0)/$(basename $0)
  local tests=$(grep "^test.*\(\)" $loc  | cut -d"(" -f1)
  for t in $tests ; do
    echo ">> $t"
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
    echo "!! $1 not equal to $2"
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
  [[ $r == 0 ]] && Pass
  [[ $r != 0 ]] && Fail
}


