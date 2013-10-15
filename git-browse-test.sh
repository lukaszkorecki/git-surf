#!/usr/bin/env bash

source picotest.sh

# ------ Begin test suite ------------ #
NOOPEN=y # do not open urls and do not print debug information

# load git-browse functions
source ./git-browse

# "fixtures"
current_branch=$(currentBranch)
current_urlencoded_branch=$(urlSafeCurrentBranch);
prefix="https://github.com/lukaszkorecki/git-browse"
commit="1e90d9e"

# basic url test
testBasic() {
  local url=$(NOOPEN=y ./git-browse)
  echo ">> Test basic repository url"
  Check "assertEquals" "$url" "$prefix/tree/$current_branch/"
}

testUrlencode() {
  local url=$(NOOPEN=y ./git-browse -p)
  echo ">> Test urlencoding branch name in pull request url"
  Check "assertEquals" "$url" "$prefix/pull/$current_urlencoded_branch"
}

testCommitUrl() {
  local url=$(NOOPEN=y ./git-browse -c $commit)
  echo ">> Test commit url"
  Check "assertEquals" "$url" "$prefix/commit/$commit"
}

testFileUrl() {
  local url=$(NOOPEN=y ./git-browse git-browse)
  echo ">> Test commit url"
  Check "assertEquals" "$url" "$prefix/tree/$current_branch/git-browse"
}

Run
Report

exit $failed
