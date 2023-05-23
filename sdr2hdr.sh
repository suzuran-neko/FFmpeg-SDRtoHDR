#!/bin/sh

# set your FFmpeg path
FFmpeg=~/ffmpeg
# AAC encoder
AACEnc=${3:-copy}

if [ $# -eq 0 ]; then
  echo "\033[1;31mNo arguments specified!\033[0m" >&2
  exit 1
fi
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "\033[1;31mPrease set input file and output file!\033[0m" >&2
  exit 1
fi
$FFmpeg -i "$1" -c:v libx265 -preset slower \
-vf "zscale=t=linear:npl=100,tonemap=tonemap=hable:desat=0,zscale=t=arib-std-b67:m=bt2020nc:p=bt2020:npl=800,format=p010le" \
-tag:v hvc1 -crf 20 -c:a "$AACEnc" -b:a 320k -ar 48k "$2"
