#!/usr/bin/env bash -e +x
workingDir="$( cd "$( dirname "${BASH_SOURCE[0]%}" )" && pwd )"
source $workingDir/picotest.sh


# load git-browse functions
# do not open urls and do not print debug information
NOOPEN=y
gitBrowsePath=$workingDir/../git-browse
source $gitBrowsePath

# "fixtures"
currentBranch=$(currentBranch)
currentUrlencodedBranch=$(urlSafeCurrentBranch);
prefix="https://github.com/lukaszkorecki/git-browse"
commit="1e90d9e"

# basic url test
testBasic() {
  local url=$(NOOPEN=y $gitBrowsePath)
  PP "Test basic repository url"
  Check "assertEquals" "$url" "$prefix/tree/$currentBranch/"
}

testUrlencode() {
  local url=$(NOOPEN=y $gitBrowsePath -p)
  PP "Test urlencoding branch name in pull request url"
  Check "assertEquals" "$url" "$prefix/pull/$currentUrlencodedBranch"
}

testCommitUrl() {
  local url=$(NOOPEN=y $gitBrowsePath -c $commit)
  PP "Test commit url"
  Check "assertEquals" "$url" "$prefix/commit/$commit"
}

testFileUrl() {
  local url=$(NOOPEN=y $gitBrowsePath $workingDir/../git-browse)
  PP "Test commit url"
  Check "assertEquals" "$url" "$prefix/tree/$currentBranch/git-browse"
}

Run
Report
Finish
