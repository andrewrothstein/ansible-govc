#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/vmware/govmomi/releases/download

dl() {
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tar.gz}
    local platform="${os}_${arch}"
    local file="govc_${platform}.${archive_type}"
    local url="$MIRROR/$ver/$file"
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep $file $lchecksums | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    local url="$MIRROR/$ver/checksums.txt"
    local lchecksums="$DIR/govc_${ver}_checksums.txt"
    if [ ! -e $lchecksums ];
    then
        curl -sSLf -o $lchecksums $url
    fi

    printf "  # %s\n" $url
    printf "  %s:\n" $ver

    dl $ver $lchecksums Darwin x86_64
    dl $ver $lchecksums Darwin arm64
    dl $ver $lchecksums FreeBSD arm64
    dl $ver $lchecksums FreeBSD armv6
    dl $ver $lchecksums FreeBSD x86_64
    dl $ver $lchecksums Linux arm64
    dl $ver $lchecksums Linux armv6
    dl $ver $lchecksums Linux mips64le
    dl $ver $lchecksums Linux x86_64
    dl $ver $lchecksums Windows armv6 zip
    dl $ver $lchecksums Windows arm64 zip
    dl $ver $lchecksums Windows x86_64 zip
}

dl_ver ${1:-v0.30.0}
