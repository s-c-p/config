#!/bin/bash

curr="$PWD/bin"

debs="$(
	for aPkg in 'git' 'terminator' 'tools' 'vim' 'fish'; do
		ls -d -1 $curr/$aPkg/*
	done
)"

#du $debs
sudo dpkg -i $debs
