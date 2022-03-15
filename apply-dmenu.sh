#!/bin/bash
dmenu_repo=$(printf '%s' "$*" | tr ' ' '+' )
cd $dmenu_repo
cp -rf ~/.cache/wal/colors-wal-dmenu.h $dmenu_repo

mapfile -t results < <(grep -wi "#include ./colors-wal-dmenu" $dmenu_repo/config.h)
num=${#results[@]}

if ((num == 0)); then
    sudo make install   
else
    echo '#include "./colors-wal-dmenu.sh"' >> $dmenu_repo/config.h
    sudo make install
fi
