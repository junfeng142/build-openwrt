#!/bin/bash

TAG=amd64
if [ ! -z "$1" ];then
	TAG=$1
fi

TMPDIR=openwrt_rootfs
OUTDIR=dockerimgs/docker
IMG_NAME=javonca/openwrt

[ -d "$TMPDIR" ] && rm -rf "$TMPDIR"

mkdir -p "$TMPDIR"  && \
mkdir -p "$OUTDIR"  && \
gzip -dc openwrt-x86-64-rootfs.tar.gz | ( cd "$TMPDIR" && tar xf - ) && \
cp -f patches/rc.local "$TMPDIR/etc/" && \
cp -f patches/cpustat "$TMPDIR/usr/bin/" && chmod 755 "$TMPDIR/usr/bin/cpustat" && \
cp -f patches/getcpu "$TMPDIR/bin/" && chmod 755 "$TMPDIR/bin/getcpu" && \
cat patches/luci-admin-status-index-html.patch | (cd "$TMPDIR/usr/lib/lua/luci/view/admin_status/" && patch -p0) && \
rm -f "$TMPDIR/etc/bench.log" && \
echo "37 7 * * * /etc/coremark.sh" >> "$TMPDIR/etc/crontabs/root" && \
rm -rf "$TMPDIR/lib/firmware/*" "$TMPDIR/lib/modules/*" && \
(cd "$TMPDIR" && tar cf ../openwrt-default-rootfs-patched.tar .) && \
rm -f DockerImg-OpenwrtAmd64-${TAG}.gz && \
docker buildx build --no-cache --platform=linux/amd64 -o type=docker -t ${IMG_NAME}:${TAG} . && \
rm -f  openwrt-default-rootfs-patched.tar && \
rm -rf "$TMPDIR" && \
docker save ${IMG_NAME}:${TAG} | pigz -9 > $OUTDIR/docker-img-openwrt-${TAG}-${TAG}.gz
