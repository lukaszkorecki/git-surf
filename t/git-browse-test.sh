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

testBasic() {
  local url=$(NOOPEN=y $gitBrowsePath)
  PP "Basic functionality check"
  Check "assertEquals" "$url" "$prefix/tree/$currentBranch/"
}

testUrlencode() {
  local url=$(NOOPEN=y $gitBrowsePath -p)
  PP "Branches need to be url encoded when opening pull request urls"
  Check "assertEquals" "$url" "$prefix/pull/$currentUrlencodedBranch"
}

testCommitUrl() {
  local url=$(NOOPEN=y $gitBrowsePath -c $commit)
  Check "assertEquals" "$url" "$prefix/commit/$commit"
}

testFileUrl() {
  local url=$(NOOPEN=y $gitBrowsePath $workingDir/../git-browse)
  PP "Link to a file"
  Check "assertEquals" "$url" "$prefix/tree/$currentBranch/git-browse"
}

testFileUrlWithRange() {
  local url=$(NOOPEN=y $gitBrowsePath -r20,30 $workingDir/../git-browse)
  PP "Link to a file with line range"
  Check "assertEquals" "$url" "$prefix/tree/$currentBranch/git-browse#L20-L30"
}

testFileUrlWithLine() {
  local url=$(NOOPEN=y $gitBrowsePath -r20 $workingDir/../git-browse)
  PP "Link to a specific line in a file"
  Check "assertEquals" "$url" "$prefix/tree/$currentBranch/git-browse#L20"
}

testCompareURL() {
  local url=$(NOOPEN=y $gitBrowsePath -C test)
  PP "Open branch comparison url"
  Check 'assertEquals' "$url" "$prefix/compare/$(currentBranch)...test"
}

Run
Report
Finish
