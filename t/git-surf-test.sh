#!/usr/bin/env bash -e +x
workingDir="$( cd "$( dirname "${BASH_SOURCE[0]%}" )" && pwd )"
source $workingDir/picotest.sh


# load git-surf functions
# do not open urls and do not print debug information
NOOPEN=y
gitSurfPath=$workingDir/../git-surf
source $gitSurfPath

# "fixtures"
currentBranch=$(currentBranch)
currentUrlencodedBranch=$(urlSafeCurrentBranch);
prefix="https://github.com/lukaszkorecki/git-surf"
commit="1e90d9e"

testBasic() {
  local url=$(NOOPEN=y $gitSurfPath)
  PP "Basic functionality check"
  Check "assertEquals" "$url" "$prefix/tree/$currentBranch/"
}

testUrlencode() {
  local url=$(NOOPEN=y $gitSurfPath -p)
  PP "Branches need to be url encoded when opening pull request urls"
  Check "assertEquals" "$url" "$prefix/pull/$currentUrlencodedBranch"
}

testCommitUrl() {
  local url=$(NOOPEN=y $gitSurfPath -c $commit)
  Check "assertEquals" "$url" "$prefix/commit/$commit"
}

testFileUrl() {
  local url=$(NOOPEN=y $gitSurfPath $workingDir/../git-surf)
  PP "Link to a file"
  Check "assertEquals" "$url" "$prefix/tree/$currentBranch/git-surf"
}

testFileUrlWithRange() {
  local url=$(NOOPEN=y $gitSurfPath -r20,30 $workingDir/../git-surf)
  PP "Link to a file with line range"
  Check "assertEquals" "$url" "$prefix/tree/$currentBranch/git-surf#L20-L30"
}

testFileUrlWithLine() {
  local url=$(NOOPEN=y $gitSurfPath -r20 $workingDir/../git-surf)
  PP "Link to a specific line in a file"
  Check "assertEquals" "$url" "$prefix/tree/$currentBranch/git-surf#L20"
}

testCompareURL() {
  local url=$(NOOPEN=y $gitSurfPath -C test)
  PP "Open branch comparison url"
  Check 'assertEquals' "$url" "$prefix/compare/test...$(currentBranch)"
}

Run
Report
Finish
