#!/bin/sh
ffmpeg -y \
	-f decklink \
	-i 'DeckLink Mini Recorder (1)@11' \
	-c:v rawvideo -c:a pcm_s16le \
	-f matroska \
	tcp://localhost:10000
