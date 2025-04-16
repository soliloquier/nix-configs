{ pkgs }:

pkgs.writeShellScriptBin "bookmarks" ''
#!/bin/bash

url="$(sed "s/\s*#.*//g; /^$/ d" ~/stor/bcomp/urls | wmenu -l 10)"

[ -n "$url" ] && wlrctl keyboard type "$url"
''
