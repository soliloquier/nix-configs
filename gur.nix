{ pkgs }:

pkgs.writeShellScriptBin "gur" ''
#!/bin/sh

pwd >> "pwd_out"
rest="$(awk -F "/" '{print $NF}' "pwd_out")"
git remote set-url origin git@codeberg.org:compuhsition/"$rest".git && rm pwd_out
''
