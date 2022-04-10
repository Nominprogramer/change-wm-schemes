#!/bin/bash

dmenu_repo=$(printf '%s' "$*" | tr ' ' '+' )
cd $dmenu_repo
cp ~/.cache/wal/colors-wal-dmenu.h $dmenu_repo ; echo "lolies"

mapfile -t results < <(grep -wi "#include ./colors-wal-dmenu" $dmenu_repo/config.h)
num=${#results[@]}

if ((num != 0)); then
     echo '#include "./colors-wal-dmenu.sh"' >> $dmenu_repo/config.h
     sudo make clean install
else
    sudo make clean install   
fi
