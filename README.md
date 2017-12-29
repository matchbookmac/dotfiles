TODO:
install xsh
install prelude

## DOTFILES

Ian MacDonald (<a href="https://github.com/matchbookmac" target="#">GitHub</a>)

GNU General Public License, version 3 (see below). Copyright (c) 2015-2016 Ian C. MacDonald.

### Description

Configuration files for setting up working environment.

### Setup

This app was written in `shell`.

Fast:

``` console
curl -fsSL "https://raw.githubusercontent.com/matchbookmac/dotfiles/master/install?$(date +%s)" > install && bash -i install
```

Clone install:

```console
cd dotfiles
./install.sh
```

For Common Lisp setup, sbcl is installed with homebrew, and quicklisp should also be installed via rcup.
See the following for more installation details.
http://abizern.org/2013/03/31/setting-up-for-lisp-on-os-x/
https://www.quicklisp.org/beta/
https://common-lisp.net/project/slime/doc/html/Running.html#Running

### License ###
Copyright  (C)  2015-2016  Ian C. MacDonald

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
