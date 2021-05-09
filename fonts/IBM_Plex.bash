#!/usr/local/bin/bash

tmpname_unixtimed() {
    echo "${1:-$RANDOM}-`date +%s`"
    return 0
}

checkin_dir() {
    mkdir -p $1
    pushd $1 > /dev/null
}

checkout_dir() {
    popd > /dev/null
    rm -rf $1
}

version=v5.1.3
tmpspace=~/tmp/`tmpname_unixtimed IBM_Plex_Mono`

checkin_dir $tmpspace

curl -o ttfzip -L https://github.com/IBM/plex/releases/download/${version}/TrueType.zip

unzip -qq ttfzip -d ttf

find ttf -type f -name '*.ttf' | xargs -I_x1 \cp -f _x1 ~/Library/Fonts/

checkout_dir $tmpspace

