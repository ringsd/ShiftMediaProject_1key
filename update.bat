set DIR_PATH=AMF ^
bzip2 ^
enca ^
expat ^
fdk-aac ^
FFmpeg ^
FFVS-Project-Generator ^
fontconfig ^
freetype2 ^
fribidi ^
game-music-emu ^
gmp ^
gnutls ^
harfbuzz ^
lame ^
libaacs ^
libarchive ^
libass ^
libbdplus ^
libbluray ^
libcdio ^
libcdio-paranoia ^
libdvdcss ^
libdvdnav ^
libdvdread ^
libgcrypt ^
libgpg-error ^
libiconv ^
libilbc ^
liblzma ^
libssh ^
libvpx ^
libxml2 ^
mfx_dispatch ^
modplug ^
mpv ^
nettle ^
ogg ^
openssl ^
opus ^
PortAudio ^
rtmpdump ^
SDL ^
ShiftMediaProject.github.io ^
soxr ^
speex ^
theora ^
vorbis ^
VSNASM ^
VSYASM ^
x264 ^
x265 ^
xvid ^
zlib

for %%f in (%DIR_PATH%) do (
    cd ../%%f
    git pull --progress -v --no-rebase "origin"
    cd -
)

pause