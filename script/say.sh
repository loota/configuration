#!/bin/sh
pico2wave -l=en-GB -w=toto.wav "$*" && aplay toto.wav
