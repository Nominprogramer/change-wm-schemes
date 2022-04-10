#!/bin/bash
dwm_repo=$(printf '%s' "$*" | tr ' ' '+' )
cd $dwm_repo
cp -rf ~/.cache/wal/colors-wal-dwm.h $dwm_repo ; echo "nicewm uwu"

mapfile -t results < <(grep -wi "#include ~/dwm/colors-wal-dwm" $dwm_repo/config.h)
num=${#results[@]}

if ((num != 0)); then
    echo '#include "~/dwm/colors-wal-dmenu.sh"' >> $dwm_repo/config.h
    sudo make clean install
else
    sudo make clean install
fi
