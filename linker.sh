#!/bin/bash
SPATH=`pwd`
DPATH=$HOME"/.config"

if [ ! -d "$SPATH" ] || [ ! -d "$DPATH" ]; then
    echo "Source or destination path did not exist"
    exit 1
fi

function linker(){
    if [ -d "$DPATH/$1" ] && [ ! -L "$DPATH/$1" ]; then
         echo "$1 Path already existed"
     elif [ -L $DPATH"/"$1 ]; then
         ln -sf "$SPATH/$1" "$DPATH/$1"
         echo "Symlink ${1^^} overwritten"
     else
         ln -s "$SPATH/$1" "$DPATH/$1"
         echo "Symlink ${1^^} created"
     fi
}

for FOLDER in "$SPATH/*/"
do
    if [ -d "$FOLDER" ]; then
        FNAME=$(basename "$FOLDER")
        linker "$FNAME"
    fi
done
