#!/bin/bash


tmp_folder="/tmp/clipboard"

c () {
# if a clipboard folder doesn't exist in temp make it
if [ ! -d $tmp_folder ]; then
    mkdir $tmp_folder
fi

if [ -e $1 ]; then
    # clear the clipboard folder
    rm "$tmp_folder"/* -r -f

    # copy $1 to the clipboard folder
    cp $1 $tmp_folder -r

    echo "Clipped $1"
else
    echo "Cannot clip $1: no such file or directory"
fi
}

p () {
# if there is something in the clipboard folder copy it to $1
if [ -z "$(ls -A $tmp_folder)" ]; then
    echo "Clipboard empty"
else
    echo "Pasting clipboard to ${1:-.}"
    cp "$tmp_folder"/* ${1:-.} -i
fi
}
