#!/bin/sh
if [ $# -lt 2 ]
then
    lang=en-GB
else
    lang=$1
fi
shift 1
pico2wave -l=$lang -w=toto.wav "$*" && aplay toto.wav
