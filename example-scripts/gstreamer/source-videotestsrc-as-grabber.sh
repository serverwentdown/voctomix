#!/bin/sh
. `dirname "$0"`/../config.sh
gst-launch-1.0 \
	videotestsrc pattern=snow !\
		video/x-raw,format=UYVY,width=$WIDTH,height=$HEIGHT,framerate=$FRAMERATE/1,pixel-aspect-ratio=1/1 ! \
		mux. \
	\
	audiotestsrc !\
		audio/x-raw,format=S16LE,channels=2,layout=interleaved,rate=$AUDIORATE !\
		mux. \
	\
	matroskamux name=mux !\
		tcpclientsink host=localhost port=10002
