git-surf
==========

[![Build Status](https://travis-ci.org/lukaszkorecki/git-surf.png?branch=master)](https://travis-ci.org/lukaszkorecki/git-surf)

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/lukaszkorecki/git-surf/trend.png)](https://bitdeli.com/free "Bitdeli Badge")


git-surf is a nifty little script which can open various things on GitHub:

- `git surf` - will open/print a GitHub url for current repository and current branch
- `git surf <path to file>` will open/print a GithHub url for the given file on current branch
  this option also supports line ranges, for example `git surf -l10,20 README.md`
- `git surf -c <commit sha>` will open/print a GitHub url for the given commit
- `git surf -p` will open/print a GitHub url to a pull request based on current branch
- `git surf -C <branch name>` will open/print a GitHub url showing compare view between given and current branch

It uses `open` on OSX and `xdg-open` on Linux with X installed. If none of these
are available it will simply print the URL to STDOUT. Errors are logged to STDERR.


install
=======

system-wide installation
------------------------

`sudo make install` to install to `/usr/local/bin/git-surf

user's location
---------------

`make install INSTALL_PATH=my/.dotfiles/bin/git-surf`
  - will install `git-surf` to `/my/.dotfiles/bin/git-surf`

*Please note that `/my/.dotfiles/bin` needs to be in your PATH for git-surf to work!*


requirements
============

- `bash 3+`
- `some GNU` core utils like `cut`, `awk`, `sed` and `grep`
- `git`

bugs
====


Some, please create issues


licence
=======

MIT


