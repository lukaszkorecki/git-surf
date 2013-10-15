git-browse
==========

git-browse is a nifty little script which can open various things on GitHub:

- `git browse` - will open/print a GitHub url for current repository and current branch
- `git browse <path to file>` will open/print a GithHub url for the given file on current branch
  this option also supports line ranges, for example `git browse -l10,20 README.md`
- `git browse -c <commit sha>` will open/print a GitHub url for the given commit
- `git browse -p` will open/print a GitHub url to a pull request based on current branch
- `git browse -C <branch name>` will open/print a GitHub url showing compare view between given and current branch

It uses `open` on OSX and `xdg-open` on Linux with X installed. If none of these 
are available it will simply print the URL to STDOUT. Errors are logged to STDERR.


install
=======

system-wide installation
------------------------

`sudo make install` to install to `/usr/local/bin/git-browse

user's location
---------------

`make install INSTALL_PATH=my/.dotfiles/bin/git-browse` 
  - will install `git-browse` to `/my/.dotfiles/bin/git-browse` 

*Please note that `/my/.dotfiles/bin` needs to be in your PATH for git-browse to work!*


requirements
============

- `bash 3+`
- `some GNU` core utils like `cut`, `awk`, `sed` and `grep`
- `git`

bugs
====


plenty


licence
=======

MIT



[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/lukaszkorecki/git-browse/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

