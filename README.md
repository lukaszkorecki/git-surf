:surfer: git-surf
==========

[![Build Status](https://travis-ci.org/lukaszkorecki/git-surf.png?branch=master)](https://travis-ci.org/lukaszkorecki/git-surf) 


git-surf is a nifty little script which can open various things on GitHub.

* -r - range of lines to highlight can be single line, or a range of lines, comma
       separated (10,30) - works only if opening a file
* -c - opens specified commit
* -R - sets different remote than origin
* -p - opens a pull requests for current branch
* -C - opens a compare branch view on github, needs a branch name as an argument
*      defaults to master
* -v - prints version and release date
* -h - this

It uses `open` on OSX and `xdg-open` on Linux with X installed. If none of these
are available it will simply print the URL to STDOUT. Errors are logged to STDERR.


install
=======

system-wide installation
------------------------

`sudo make install` to install to `/usr/local/bin/git-surf`

user's location
---------------

`make install INSTALL_PATH=my/.dotfiles/bin/git-surf`
  - will install `git-surf` to `/my/.dotfiles/bin/git-surf`

*Please note that `/my/.dotfiles/bin` needs to be in your PATH for git-surf to work!*


requirements
============

- `bash 3+`
- `some GNU` core utils like `awk`, `sed` and `grep`
- `git`

bugs
====


Some, please create issues


license
=======

MIT


