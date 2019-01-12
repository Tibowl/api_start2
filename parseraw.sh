#!/bin/bash

if [ -f raw.json ]; then
    echo "Beautify..."
    rm parsed/*
    mkdir parsed
	node ../JSFormatter/handleStart2.js raw.json start2.json
	if [ -f start2.json ]; then
        rm raw.json
		git add -u :/
        git add *.json
		ldate=`date -I`
		git commit -m "Update $ldate"
        git push
	fi
fi