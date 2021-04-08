#!/bin/bash
export TMPDIR=D:/ShiftMediaProject/FFmpeg
NDK=c:/Users/ringsd/AppData/Local/Android/android-ndk-r14b
API=24
PLATFORM=aarch64-linux-android
TOOLCHAIN=$NDK/toolchains/$PLATFORM-4.9/prebuilt/windows-x86_64
SYSROOT=$NDK/platforms/android-$API/arch-arm64
ISYSROOT=$NDK/sysroot
ASM=$ISYSROOT/usr/include/$PLATFORM
CPU=armv8-a
PREFIX=$TMPDIR/android/arm64-v8a

#arm64-v8a
#armeabi-v7a

echo ${TOOLCHAIN}
echo ${SYSROOT}
echo ${ISYSROOT}
echo ${ASM}

build_one()
{
./configure \
--ln_s="cp -rf" \
--prefix=$PREFIX \
--target-os=android \
--arch=arm \
--cpu=$CPU \
--cross-prefix=$TOOLCHAIN/bin/$PLATFORM- \
--cc=$TOOLCHAIN/bin/$PLATFORM-gcc \
--nm=$TOOLCHAIN/bin/$PLATFORM-nm \
--disable-asm \
--enable-cross-compile \
--enable-shared \
--disable-static \
--enable-runtime-cpudetect \
--disable-doc \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-doc \
--disable-symver \
--enable-small \
--enable-gpl --enable-nonfree --enable-version3 --disable-iconv \
--enable-jni \
--enable-mediacodec \
--disable-decoders --enable-decoder=vp9 --enable-decoder=h264 --enable-decoder=mpeg4 --enable-decoder=aac \
--disable-encoders --enable-encoder=vp9_vaapi --enable-encoder=h264_nvenc --enable-encoder=h264_v4l2m2m --enable-encoder=hevc_nvenc \
--disable-demuxers --enable-demuxer=rtsp --enable-demuxer=rtp --enable-demuxer=flv --enable-demuxer=h264 \
--disable-muxers --enable-muxer=rtsp --enable-muxer=rtp --enable-muxer=flv --enable-muxer=h264 \
--disable-parsers --enable-parser=mpeg4video --enable-parser=aac --enable-parser=h264 --enable-parser=vp9 \
--disable-protocols --enable-protocol=rtmp --enable-protocol=rtp --enable-protocol=tcp --enable-protocol=udp \
--disable-bsfs \
--disable-indevs --enable-indev=v4l2 \
--disable-outdevs \
--disable-filters \
--disable-postproc \
--sysroot=$SYSROOT \
--extra-cflags="-I$ASM -isysroot $ISYSROOT -D__ANDROID_API__=$API -U_FILE_OFFSET_BITS -Os -fPIC -DANDROID -D__thumb__ -Wfatal-errors -Wno-deprecated -march=armv8-a" \
--extra-ldflags="-L${SYSROOT}/usr/lib"
$ADDITIONAL_CONFIGURE_FLAG

sed -i 's/HAVE_STRUCT_IP_MREQ_SOURCE 1/HAVE_STRUCT_IP_MREQ_SOURCE 0/g' config.h
}

build_one
make clean
make -j4
make install
