#!/usr/bin/env sh

DIR=~/Downloads
MIRROR=https://github.com/vmware/govmomi/releases/download

dl() {
    ver=$1
    os=$2
    arch=$3
    compress_type=$4
    local platform="${os}_${arch}"
    local url=$MIRROR/${ver}/govc_${platform}.${compress_type}
    local lfile=$DIR/govc_${ver}_${platform}.${compress_type}

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver darwin 386 gz
    dl $ver darwin amd64 gz
    dl $ver freebsd 386 gz
    dl $ver freebsd amd64 gz
    dl $ver linux 386 gz
    dl $ver linux amd64 gz
    dl $ver windows 386 exe.zip
    dl $ver windows amd64 exe.zip
}

dl_ver ${1:-v0.21.0}
